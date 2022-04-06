import 'package:flutter/material.dart';
import 'taskManager.dart';
import 'task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ToDoPage(),
    );
  }
}

TaskManager taskManager = TaskManager();

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);
  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: const Text('TODO APP'),
      ),
      body: SafeArea(
        child: Container(
          child: getTaskTileListUI(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //showModalBottomSheet(context: context, builder: buildBottomSheet);
          //taskManager.addTask('Task D');
          //addTask('Task D');
          setState(() {
            taskManager.taskList
                .add(Task(taskName: 'newTask', taskChecked: false));
            //taskManager.removeTask(taskManager.taskList.length - 1 - 0);
          });
          print(taskManager.taskList.length);
          //print('a');
        },
        tooltip: 'Add New Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget buildBottomSheet(BuildContext context) {
  return Container(
    child: Center(
      child: Text('abc'),
    ),
  );
}

Widget getTaskTileListUI() {
  List<TaskTile> taskTileList = [];

  for (int i = 0; i < taskManager.taskList.length; i++) {
    taskTileList.add(TaskTile(taskManager.taskList[i].taskName));
  }

  return Column(
    children: taskTileList,
  );
}

class TaskTile extends StatefulWidget {
  String taskTileName;

  TaskTile(this.taskTileName);

  @override
  State<TaskTile> createState() => _TaskTileState(taskTileName);
}

class _TaskTileState extends State<TaskTile> {
  String taskTileName;

  _TaskTileState(this.taskTileName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(taskTileName),
          Checkbox(value: false, onChanged: (onChanged) {}),
          Icon(Icons.edit),
          FlatButton(
            onPressed: () {
              setState(() {
                taskManager.removeTask(0);
              });
            },
            child: Icon(Icons.remove_circle_outline),
          )
        ],
      ),
    );
  }
}
