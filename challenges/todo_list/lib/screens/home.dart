import 'package:flutter/material.dart';
import 'package:todo_list/components/loading_dialog.dart';
import 'package:todo_list/components/task_form.dart';
import 'package:todo_list/components/task_item.dart';
import 'package:todo_list/database/dao/task_dao.dart';
import 'package:todo_list/models/task.dart';

class Home extends StatefulWidget {
  final TextEditingController controllerTask = TextEditingController();

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TaskDao _dao = TaskDao();

  @override
  Widget build(BuildContext context) {
    void _handleSubmit(String text) async {
      if (text != '') {
        try {
          // Loading
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => const LoadingDialog(),
          );

          final Task newTask = Task(title: text, isDone: false);

          await _dao.save(newTask);

          setState(() {
            widget.controllerTask.clear();
            FocusManager.instance.primaryFocus?.unfocus();
          });
        } catch (error) {
          debugPrint(error.toString());
        } finally {
          // End loading
          Navigator.of(context).pop();
        }
      }
    }

    void _handleUpdateTaskStatus(Task task) async {
      try {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const LoadingDialog(),
        );

        if (task.isDone) {
          await _dao.delete(task.id!);
        } else {
          await _dao.update(
            Task(
              id: task.id,
              title: task.title,
              isDone: true,
            ),
          );
        }

        setState(() {});
      } catch (error) {
        debugPrint(error.toString());
      } finally {
        Navigator.of(context).pop();
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('TODO LIST'),
        ),
        body: Column(
          children: [
            TaskForm(
                onSubmit: _handleSubmit, controllerTask: widget.controllerTask),
            FutureBuilder<List<Task>>(
              initialData: const [],
              future: _dao.findAll(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Text('Empty');

                  case ConnectionState.waiting:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          Text('Loading'),
                        ],
                      ),
                    );

                  case ConnectionState.active:
                    break;

                  case ConnectionState.done:
                    final List<Task> tasksList = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: tasksList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var task = tasksList[index];

                        return TaskItem(
                          task: task,
                          onTap: () => _handleUpdateTaskStatus(task),
                        );
                      },
                    );
                }

                return const Text('Unknown error');
              },
            ),
          ],
        ));
  }
}
