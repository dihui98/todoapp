import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [];

  TaskData() {
    initialData();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String? newTaskTitle, bool? completed) {
    final task = Task(name: newTaskTitle!, isDone: completed!);
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

  initialData() async {
    try {
      var response =
          await Dio().get('https://dummyjson.com/todos/user/1?limit=5');
      int total = jsonDecode((response.data)['total'].toString());
      for (int i = 0; i < total; i++) {
        addTask(
          jsonDecode(jsonEncode((response.data)['todos'][i]['todo'])),
          jsonDecode(jsonEncode((response.data)['todos'][i]['completed'])),
        );
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
