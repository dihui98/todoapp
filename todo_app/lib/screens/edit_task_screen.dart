import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class EditTaskScreen extends StatelessWidget {
  final String? taskTitle;
  final Function? updateCallback;

  EditTaskScreen({this.taskTitle, this.updateCallback});

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle = taskTitle;

    return Consumer<TaskData>(builder: (context, taskData, child) {
      return SafeArea(
        child: Container(
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
                  'Edit Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                TextField(
                  controller: TextEditingController()..text = '$taskTitle',
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (newText) {
                    print(newText);
                    newTaskTitle = newText;
                  },
                ),
                FlatButton(
                  color: Colors.lightBlueAccent,
                  onPressed: () => updateCallback!(newTaskTitle),
                  child: const Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
