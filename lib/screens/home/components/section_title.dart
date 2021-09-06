import 'package:flutter/material.dart';

class SectionTitleComponent extends StatelessWidget {
  String title;

  SectionTitleComponent({this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 20),
      child: Text(title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
    );
  }
}
