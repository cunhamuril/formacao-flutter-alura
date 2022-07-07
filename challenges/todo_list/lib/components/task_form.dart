import 'package:flutter/material.dart';

class TaskForm extends StatelessWidget {
  final Function(String text) onSubmit;
  final TextEditingController controllerTask;

  TaskForm({
    Key? key,
    required this.onSubmit,
    required this.controllerTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: controllerTask,
            decoration: const InputDecoration(
              hintText: 'Insert task',
            ),
            onSubmitted: onSubmit,
          ),
        ),
        ElevatedButton(
          onPressed: () => onSubmit(controllerTask.text),
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
