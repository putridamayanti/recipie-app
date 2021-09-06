import 'package:flutter/material.dart';
import 'package:recipie_flutter/components/input.dart';

class MealScreen extends StatefulWidget {
  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  List<Widget> pages = [];
  TextEditingController keyword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 120,
              child: Stack(
                children: [
                  Container(
                    height: 90,
                    color: Colors.amber,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: InputComponent(
                      controller: keyword,
                      icon: Icons.search,
                      hint: 'Search by Meal',
                    ),
                  )
                ],
              ),
            ),
            Container(
                child: Row(children: [
              Text('Popular Taste'),
              Icon(
                Icons.filter_alt_outlined,
                color: Colors.grey.shade600,
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
