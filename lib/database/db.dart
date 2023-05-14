import 'package:hive_flutter/hive_flutter.dart';

class TodoDb {
  List todoList = [];

  // refernce
  final _hbox = Hive.box('hbox');

  // run this when opening the app 1st time
  void createInitData() {
    todoList = [
      ["Read Books", false],
      ["Code App", false],
    ];
  }

  // load the data from the database
  void loadData() {
    todoList = _hbox.get("ToDoList");
  }

  // update the database
  void updateData() {
    _hbox.put("ToDoList", todoList);
  }
}
