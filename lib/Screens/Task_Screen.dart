import 'package:flutter/material.dart';
import 'package:todo_app/Widgets/Tasks_list.dart';
import 'package:todo_app/Add_tasks.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/main.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(
            Icons.add,
            size: 40,
          ),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                    child: Container(
                  // padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTasks(),
                ));
              },
            );
          },
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      child: Icon(Icons.list, size: 30, color: Colors.lightBlueAccent),
                      backgroundColor: Colors.white,
                      radius: 30),
                  SizedBox(height: 10),
                  Text(
                    'Todoey',
                    style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '${context.watch<Taskmaker>().tasks.length} tasks to do ',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 30, left: 30),
                height: 7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: TaskList(),
              ),
            ),
          ],
        ));
  }
}
