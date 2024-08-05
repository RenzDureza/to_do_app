import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/db/database.dart';

class Folder extends StatelessWidget {
  final String folderName;
  Function(BuildContext) deleteFunc;
  TodoDataBase db = TodoDataBase();

  Folder({
    super.key,
    required this.folderName,
    required this.deleteFunc,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(117, 164, 197, 1.000),
          borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            folderName,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: GoogleFonts.playfairDisplay(
                color: Color.fromRGBO(27, 71, 105, 1.000),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: Text(
            "content",
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: GoogleFonts.playfairDisplay(
                color: Color.fromRGBO(80, 127, 169, 1.000), fontSize: 15),
          )),
          Row(
            children: [
              Text(
                "date",
                style: GoogleFonts.playfairDisplay(
                    color: Color.fromRGBO(80, 127, 169, 1.000)),
              ),
              Spacer(),
              IconButton(
                onPressed: () => deleteFunc(context), 
                icon: Icon(Icons.delete)
              )
            ],
          )
        ],
      ),
    );
    ;
  }
}
