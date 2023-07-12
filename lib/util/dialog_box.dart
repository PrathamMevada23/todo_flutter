import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_flutter/util/buttons.dart';
import 'package:todo_flutter/const/colors.dart';

class DialogBox extends StatelessWidget {
  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: Colors.deepPurple[200],
      backgroundColor: Colors.transparent,
      content: Container(
        height: 150,
        width: 450,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          colors.priClr,
          colors.secnClr,
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //user input
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add new task",
                ),
              ),

              SizedBox(height: 15),

              //buttons --> save, cancel
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // save
                  Buttons(
                    text: "Save",
                    onPressed: onSave,
                  ),
                  // cancel
                  Buttons(text: "Cancel", onPressed: onCancel),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
