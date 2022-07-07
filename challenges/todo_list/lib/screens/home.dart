import 'package:flutter/material.dart';
import 'package:todo_list/components/task_form.dart';
import 'package:todo_list/components/task_item.dart';
import 'package:todo_list/models/task.dart';

class Home extends StatefulWidget {
  final List<Task> _tasksList = [];
  final TextEditingController _controllerTask = TextEditingController();

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO LIST'),
      ),
      body: Column(children: [
        TaskForm(onSubmit: _addTask, controllerTask: widget._controllerTask),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget._tasksList.length,
          itemBuilder: (BuildContext context, int index) {
            var task = widget._tasksList[index];

            return TaskItem(
              task: task,
              onTap: () => _updateTask(task),
            );
          },
        )
      ]),
    );
  }

  void _addTask(String text) {
    if (text != '') {
      setState(() {
        widget._tasksList.add(
          Task(
            title: text,
            isDone: false,
          ),
        );

        widget._controllerTask.clear();
        FocusManager.instance.primaryFocus?.unfocus();
      });
    }
  }

  void _updateTask(Task task) {
    final index = widget._tasksList.indexOf(task);

    setState(() {
      if (task.isDone) {
        widget._tasksList.removeAt(index);
      } else {
        widget._tasksList[index] = Task(
          title: task.title,
          isDone: true,
        );
      }
    });
  }
}
