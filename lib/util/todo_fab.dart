import 'package:flutter/material.dart';

class TodoFab extends StatelessWidget {
  const TodoFab({
    required this.onPressed,
    super.key
    });

  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.add),
      backgroundColor: Color.fromRGBO(117,164,197,1.000),
      foregroundColor: Color.fromRGBO(27,71,105,1.000),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      );
  }
}