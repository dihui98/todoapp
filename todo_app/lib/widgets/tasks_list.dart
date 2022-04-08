import 'package:flutter/material.dart';
import 'package:todo_app/screens/edit_task_screen.dart';
import 'package:todo_app/widgets/task_tile.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemCount: taskData.taskCount,
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            taskTitle: task.name,
            isChecked: task.isDone,
            checkboxCallback: () {
              taskData.updateData(task);
            },
            longPressCallback: () {
              taskData.deleteTask(task);
            },
            tapCallback: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => EditTaskScreen(
                  taskTitle: task.name,
                  updateCallback: (newTaskTitle) {
                    taskData.updateTask(task, newTaskTitle);
                    Navigator.pop(context);
                  },
                ),
              );
            },
          );
        },
      );
    });
  }
}
