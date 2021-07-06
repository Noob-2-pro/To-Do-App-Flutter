import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todo_app/Modals/Tasks.dart';
import 'Screens/Task_Screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Taskmaker(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

class Taskmaker extends ChangeNotifier {
  List<Tasks> _tasks = [
    Tasks(task: 'buy milk'),
    Tasks(task: 'buy bread'),
    Tasks(task: 'got to gym'),
  ];

  UnmodifiableListView<Tasks> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTask) {
    _tasks.add(Tasks(task: newTask));
    notifyListeners();
  }

  void updateTask(Tasks task) {
    task.toggleDone();
    notifyListeners();
  }

  void deletetask({Tasks task, int index}) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
