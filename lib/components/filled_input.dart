import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FilledInputComponent extends StatelessWidget {
  final TextEditingController controller;
  var hint;
  var rows;
  var focusNode;

  FilledInputComponent(
      {required this.controller, this.rows, this.hint, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 10.0,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        minLines: rows,
        maxLines: rows,
        cursorColor: Colors.grey.shade700,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
