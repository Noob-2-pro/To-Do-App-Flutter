import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String tasktitle;
  final bool ischecked;
  final Function checkBoxCallback;
  final Function taskIndex;
  TaskTile({this.tasktitle, this.ischecked, this.checkBoxCallback, this.taskIndex});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: taskIndex,
        title: Text(
          tasktitle,
          style: TextStyle(decoration: ischecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          value: ischecked,
          onChanged: checkBoxCallback,
        ));
  }
}
