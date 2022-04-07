import 'package:flutter/material.dart';
import 'task.dart';

class TaskManager {
  List<Task> taskList = [
    Task(taskName: 'Task A', taskChecked: false),
    Task(taskName: 'Task B', taskChecked: false),
    Task(taskName: 'Task C', taskChecked: false),
  ];

  void addTask(String newTask) {
    taskList.add(Task(taskName: newTask, taskChecked: false));
  }

  void removeTask(int index) {
    taskList.removeAt(index);
  }

  // void checkTask(bool isChecked){
  //   taskList
  // }

  // void updateTask(String newName){

  // }

}

