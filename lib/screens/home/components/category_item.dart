import 'package:flutter/material.dart';

class CategoryItemComponent extends StatelessWidget {
  bool active;

  CategoryItemComponent({this.active = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 80,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: active ? Colors.amber : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 10.0,
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.local_pizza,
              size: 28,
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Text('Pizza'),
            )
          ],
        ),
      ),
    );
  }
}
