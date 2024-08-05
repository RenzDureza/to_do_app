import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/db/database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/folder.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final _myBox = Hive.box('myBox');
  final textController = TextEditingController();
  TodoDataBase db = TodoDataBase();
  // create task folder
  void createTaskFolder() {
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          controller: textController, 
          onSave: saveFolder, 
          onCancel: () => Navigator.of(context).pop(),
        );
      }
    );
  }
  
  void saveFolder() {
    setState(() {
      db.todoFolder.add([textController.text]);
      textController.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void deleteFolder(int index) {
    setState(() {
      db.todoFolder.removeAt(index);
    });
    db.updateDatabase();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27,71,105,1.000),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            "TODO",
            style: GoogleFonts.playfairDisplay(color: Color.fromRGBO(117,164,197,1.000), fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 1.5),
            )
          ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createTaskFolder,
        child: const Icon(Icons.add),
        backgroundColor: Color.fromRGBO(117,164,197,1.000),
        foregroundColor: Color.fromRGBO(27,71,105,1.000),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: db.todoFolder.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 7, 
                  mainAxisSpacing: 7
                ),
                itemBuilder: (context, index) {
                  return Folder(
                    folderName: db.todoFolder[index][0],
                    deleteFunc: (context) => deleteFolder(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),


    );
  }
}