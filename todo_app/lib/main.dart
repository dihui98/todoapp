import 'package:flutter/material.dart';

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
          child: Column(
            children: [
              taskTile(),
              taskTile(),
              taskTile(),
              taskTile(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, builder: buildBottomSheet);
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

class taskTile extends StatelessWidget {
  const taskTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text('Stuff A'),
          Checkbox(value: false, onChanged: (onChanged) {}),
          Icon(Icons.edit),
          Icon(Icons.remove_circle_outline),
        ],
      ),
    );
  }
}
