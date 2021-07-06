class Tasks {
  final String task;
  bool isDone;
  Tasks({this.task, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
