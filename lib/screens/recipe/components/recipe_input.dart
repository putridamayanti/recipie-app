import 'package:flutter/material.dart';
import 'package:recipie_flutter/components/filled_input.dart';

// ignore: must_be_immutable
class RecipeInputComponent extends StatelessWidget {
  final TextEditingController controller;
  var title;
  var rows;
  var hint;

  RecipeInputComponent(
      {required this.controller, this.rows, this.title, this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Container(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(title ?? ''),
              ),
            FilledInputComponent(
              rows: rows,
              controller: controller,
              hint: hint,
            )
          ],
        ));
  }
}
