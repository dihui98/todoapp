import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Task A'),
    Task(name: 'Task B'),
    Task(name: 'Task C'),
    Task(name: 'Task D'),
    Task(name: 'Task E'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String? newTaskTitle) {
    final task = Task(name: newTaskTitle!, isDone: false);
    _tasks.add(task);
    notifyListeners();
  }

  void updateData(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void deleteAllTask() {
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].isDone) {
        deleteTask(tasks[i]);
      }
    }
    notifyListeners();
  }

  void updateTask(Task task, String newName) {
    task.toggleUpdateTitle(newName);
    notifyListeners();
  }
}
