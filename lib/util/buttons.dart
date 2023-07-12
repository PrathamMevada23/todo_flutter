import 'package:flutter/material.dart';
import 'package:todo_flutter/const/colors.dart';

class Buttons extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  Buttons({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
      color: colors.priClr,
    );
  }
}
