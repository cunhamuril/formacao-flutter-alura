class Task {
  final int? id;
  final String title;
  final bool isDone;

  Task({this.id, required this.title, required this.isDone});

  @override
  String toString() {
    return 'Task {id: $id, title: $title, isDone: $isDone}';
  }
}
