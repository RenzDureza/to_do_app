import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/util/todo_fab.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final textController = TextEditingController();


  // create task folder
  void createTaskFokder() {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text("New Folder"),
        content: TextField(
          controller: textController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              // add to db

              // clear controller
              textController.clear();
              // pop the dialog
              Navigator.pop(context);
            },
            child: const Text("Create"),
          )
        ],
      ),
    );
  }
  // read
  void readData() {

  }
  // delete
  void deleteData() {

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

      floatingActionButton: TodoFab(
        onPressed: () {},
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: 5,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 7, 
                  mainAxisSpacing: 7
                ),
                itemBuilder: (context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(117,164,197,1.000),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("title", maxLines: 1, overflow: TextOverflow.fade, style: GoogleFonts.playfairDisplay(color: Color.fromRGBO(27,71,105,1.000), fontSize: 20, fontWeight: FontWeight.bold),),

                        Expanded(child: Text('content', maxLines: 1, overflow: TextOverflow.fade, style: GoogleFonts.playfairDisplay(color: Color.fromRGBO(80,127,169,1.000), fontSize: 15),)),
                        Row(
                          children: [
                            Text("date", style: GoogleFonts.playfairDisplay(color: Color.fromRGBO(80,127,169,1.000)),),
                            Spacer(),
                            Icon(Icons.delete, color:  Color.fromRGBO(80, 127, 169, 1),)
                          ],
                        )
                      ],
                    ),
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