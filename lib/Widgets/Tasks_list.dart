import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
import 'Task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Taskmaker>(
      builder: (context, taskmaker, child) {
        return ListView.builder(
          itemBuilder: (context, int) {
            final task = taskmaker.tasks[int];
            return TaskTile(
              tasktitle: task.task,
              ischecked: task.isDone,
              checkBoxCallback: (newValue) {
                taskmaker.updateTask(task);
              },
              taskIndex: () {
                taskmaker.deletetask(task: task, index: int);
              },
            );
          },
          itemCount: taskmaker.tasks.length,
        );
      },
    );
  }
}
