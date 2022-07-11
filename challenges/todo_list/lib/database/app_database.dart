import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/database/dao/task_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'todo_list.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TaskDao.tableSql);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete, // Limpar o DB
  );
}
