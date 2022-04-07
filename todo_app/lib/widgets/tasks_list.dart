import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_tile.dart';
import 'package:todo_app/models/task.dart';

class TasksList extends StatefulWidget {
  List<Task>? tasks;

  TasksList({this.tasks});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks!.length,
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle: widget.tasks![index].name,
            isChecked: widget.tasks![index].isDone,
            checkboxCallback: () {
              setState(() {
                widget.tasks![index].toggleDone();
              });
            });
      },
    );
  }
}
