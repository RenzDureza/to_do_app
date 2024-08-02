import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged,
                activeColor: Color.fromRGBO(27,71,105,1.000),
                checkColor: Color.fromRGBO(117,164,197,1.000), 
                side: BorderSide(
                  color: Color.fromRGBO(27,71,105,1.000),
                ),
              ),
              Text(
                taskName,
                style: GoogleFonts.playfairDisplay(
                  color: Color.fromRGBO(27,71,105,1.000),
                  fontWeight:FontWeight.w700,
                  fontSize: 15,
                  decoration: taskCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none, 
              )
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(117,164,197,1.000), 
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}