import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputComponent extends StatelessWidget {
  final TextEditingController controller;
  var hint;
  final icon;
  var obscureText = false;
  var focusNode;

  InputComponent(
      {required this.controller,
      required this.icon,
      this.hint,
      this.obscureText = false,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 10.0,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: Colors.grey.shade900,
          ),
        ),
        style: TextStyle(color: Colors.grey.shade900),
        cursorColor: Colors.grey.shade700,
        obscureText: obscureText,
        focusNode: focusNode,
      ),
    );
  }
}
