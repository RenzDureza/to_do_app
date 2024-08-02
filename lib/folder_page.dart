import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/util/todo_tile.dart';

class FolderPage extends StatefulWidget {
  const FolderPage({super.key});

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
List todoList = [
  ["Review", false],
  ["Play Game", false],  
];

void checkBoxChange(bool? value, int index) {  
  setState(() {
    todoList[index][1] = !todoList[index][1];
  });
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
      
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
            "title", 
            style: GoogleFonts.playfairDisplay(
              color: Color.fromRGBO(117,164,197,1.000), 
              fontSize: 35, 
              fontWeight: FontWeight.bold, 
              letterSpacing: 1.5
              ),
            ),

            Text(
              "date",
              style: GoogleFonts.playfairDisplay(
                color: Color.fromRGBO(80,127,169,1.000),
                ),
            ),

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return TodoTile(
                    taskName: todoList[index][0],
                    taskCompleted: todoList[index][1],
                    onChanged: (value) => checkBoxChange(value, index),
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