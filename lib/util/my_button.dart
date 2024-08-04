import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color.fromRGBO(117,164,197,1.000),
      child: Text(
        text,
        style: GoogleFonts.playfairDisplay(
          color: Color.fromRGBO(27,71,105,1.000),
          fontWeight:FontWeight.w700,
          ),
        ),
      );
  }
}