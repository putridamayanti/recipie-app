import 'package:flutter/material.dart';
import 'package:recipie_flutter/components/card_product.dart';
import 'package:recipie_flutter/components/input.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Widget> pages = [];
  TextEditingController keyword = new TextEditingController();
  List<int> products = [1, 2, 3, 4, 5, 6];
  List<String> recents = ['pancake', 'meatball', 'soup'];
  List<Object> popularTopics = ['Dessert', 'Salad Steak', 'Ice Cream'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber.shade400,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey.shade800,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: TextField(
            cursorColor: Colors.grey.shade800,
            decoration: InputDecoration(
              hintText: 'Search by topics',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20, left: 10, bottom: 10),
              child: Text('History Search',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            ...recents.map((e) => recentItem(text: e)),
            Container(
              padding: EdgeInsets.only(top: 30, left: 10, bottom: 10),
              child: Text('Popular Topics',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 2.5,
                children:
                    popularTopics.map((e) => popularItem(text: e)).toList(),
              ),
            )
          ],
        ));
  }

  Widget recentItem({text}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
      child: Text(text),
    );
  }

  Widget popularItem({text}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
