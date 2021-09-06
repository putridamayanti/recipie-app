import 'package:flutter/material.dart';

class BannerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
              width: double.infinity,
              height: 300,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/banner_home.jpeg'),
                fit: BoxFit.cover,
              ))),
          Container(
            width: double.infinity,
            height: 300,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, John Doe',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'What do you want to cook for today?',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
