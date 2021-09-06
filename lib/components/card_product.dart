import 'package:flutter/material.dart';
import 'package:recipie_flutter/components/rating.dart';
import 'package:recipie_flutter/screens/recipe/recipe_screen.dart';

class CardProductComponent extends StatelessWidget {
  String imageUrl;

  CardProductComponent(
      {this.imageUrl =
          'https://images.unsplash.com/photo-1593253787226-567eda4ad32d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80'});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeScreen(),
          ),
        );
      },
      child: Container(
        width: 80,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 5, left: 15),
              child: Text(
                'Pizza',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 15),
              child: Text(
                'By John Doe',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: StarRating(
                rating: 3.5,
                color: Colors.amber,
                onRatingChanged: (rating) {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
