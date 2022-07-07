import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onTap;

  const TaskItem({
    Key? key,
    required this.task,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(task.isDone ? Icons.check_circle : Icons.circle_outlined),
        title: Text(task.title),
        selected: task.isDone,
        selectedColor: Colors.green,
      ),
    );
  }
}
