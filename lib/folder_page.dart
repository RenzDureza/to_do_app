import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/db/database.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/todo_tile.dart';

class FolderPage extends StatefulWidget {
  const FolderPage({super.key});

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  final _myBox = Hive.box('myBox');
  final _controller = TextEditingController();

  TodoDataBase db = TodoDataBase();

  void initState() {
    if(_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChange(bool? value, int index) {  
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  void saveTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void createTask() {
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

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27,71,105,1.000),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {}, 
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(117,164,197,1.000), 
            ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: const Icon(Icons.add),
        backgroundColor: Color.fromRGBO(117,164,197,1.000),
        foregroundColor: Color.fromRGBO(27,71,105,1.000),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
            "To-Do", 
            style: GoogleFonts.playfairDisplay(
              color: Color.fromRGBO(117,164,197,1.000), 
              fontSize: 35, 
              fontWeight: FontWeight.bold, 
              letterSpacing: 1.5
              ),
            ),

            Text(
              "ver 1.0",
              style: GoogleFonts.playfairDisplay(
                color: Color.fromRGBO(80,127,169,1.000),
                ),
            ),

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: db.todoList.length,
                itemBuilder: (context, index) {
                  return TodoTile(
                    taskName: db.todoList[index][0],
                    taskCompleted: db.todoList[index][1],
                    onChanged: (value) => checkBoxChange(value, index),
                    deleteFunc: (context) => deleteTask(index),
                  );
                }
              ),
            )
            
          ],
        ),
      ),

    
    );
  }
}