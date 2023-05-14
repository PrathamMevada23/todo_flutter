import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_flutter/const/colors.dart';
import 'package:todo_flutter/database/db.dart';
import 'package:todo_flutter/util/dialog_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../util/todotile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference hive box
  final _hbox = Hive.box('hbox');
  TodoDb db = TodoDb();

  void initState() {
    // if 1st time opening , create defalut data
    if (_hbox.get("ToDoList") == null) {
      db.createInitData();
    } else {
      // already exists data
      db.loadData();
    }
    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

// check box was tapped
  void checkBoxCh(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  // save new task
  void saveTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  // create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: Text('To..Do App'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.priClr,
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            colors.priClr,
            colors.secnClr,
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: db.todoList[index][0],
              taskCompleted: db.todoList[index][1],
              onChanged: (value) => checkBoxCh(value, index),
              deleteTaskButton: (context) => deleteTask(index),
            );
          },
        ),
      ),
    );
  }
}
