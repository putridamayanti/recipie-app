import 'package:flutter/material.dart';

const ALERT_SUCCESS = 'success';
const ALERT_ERROR = 'error';
const ALERT_WARNING = 'warning';

class Alert extends StatelessWidget {
  final type;
  final text;

  Alert({this.type, this.text});

  boxDecoration() {
    switch (type) {
      case ALERT_SUCCESS:
        return BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(35.0),
            border: Border.all(color: Colors.green, width: 2),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 10.0,
                color: Colors.black.withOpacity(0.1),
              )
            ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10.0),
        decoration: boxDecoration(),
        child: Center(
          child: Text(text),
        ));
  }
}
