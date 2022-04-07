import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;

    return Consumer<TaskData>(builder: (context, taskData, child) {
      return Container(
        color: const Color(0xff757575),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newText) {
                  print(newText);
                  newTaskTitle = newText;
                },
              ),
              FlatButton(
                color: Colors.lightBlueAccent,
                onPressed: () {
                  // TODO: add task features
                  taskData.addTask(newTaskTitle!);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
