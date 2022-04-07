import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Task A'),
    Task(name: 'Task B'),
    Task(name: 'Task C'),
    Task(name: 'Task D'),
    Task(name: 'Task E'),
  ];

  int get taskCount {
    return tasks.length;
  }
}
