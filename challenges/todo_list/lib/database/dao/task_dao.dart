import 'package:sqflite/sqflite.dart';
import 'package:todo_list/database/app_database.dart';
import 'package:todo_list/models/task.dart';

class TaskDao {
  static const String _tableName = 'tasks';
  static const String _id = 'id';
  static const String _title = 'title';
  static const String _isDone = 'done';

  static const String tableSql =
      'CREATE TABLE $_tableName($_id INTEGER PRIMARY KEY, $_title TEXT, $_isDone BOOLEAN)';

  Future<int> save(Task task) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> taskMap = _toMap(task);

    return db.insert(_tableName, taskMap);
  }

  Future<List<Task>> findAll() async {
    final Database db = await getDatabase();

    final List<Map<String, dynamic>> query = await db.query(_tableName);

    List<Task> tasks = _toList(query);

    return tasks;
  }

  Future<int> update(Task task) async {
    final Database db = await getDatabase();

    final Map<String, dynamic> taskMap = _toMap(task);

    return db.update(
      _tableName,
      taskMap,
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase();

    return db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Map<String, dynamic> _toMap(Task task) {
    final Map<String, dynamic> taskMap = {};

    taskMap[_title] = task.title;
    taskMap[_isDone] = task.isDone ? 1 : 0;

    return taskMap;
  }

  List<Task> _toList(List<Map<String, dynamic>> query) {
    final List<Task> tasks = [];

    for (Map<String, dynamic> row in query) {
      final Task task = Task(
        id: row[_id],
        title: row[_title],
        isDone: row[_isDone] == 1,
      );

      tasks.add(task);
    }

    return tasks;
  }
}
