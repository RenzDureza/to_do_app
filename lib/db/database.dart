import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  List todoList = [];
  final _myBox = Hive.box('myBox');

  void createInitialData() {
    todoList = [
      ["Click + button", false],
      ["Add task", false],
    ];
  }

  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  void updateDatabase() {
    _myBox.put("TODOLIST", todoList);
  }
}