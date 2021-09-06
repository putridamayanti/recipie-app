import 'package:flutter/material.dart';
import 'package:recipie_flutter/components/card_product.dart';
import 'package:recipie_flutter/components/input.dart';
import 'package:recipie_flutter/screens/explore/search_screen.dart';
import 'package:recipie_flutter/screens/home/components/banner.dart';
import 'package:recipie_flutter/screens/home/components/category.dart';
import 'package:recipie_flutter/screens/home/components/section_title.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> products = [1, 2, 3, 4, 5, 6];

  TextEditingController keyword = new TextEditingController();

  FocusNode _focus = new FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onFocusChange() {
    _focus.removeListener(_onFocusChange);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 330,
            child: Stack(
              children: [
                BannerComponent(),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: InputComponent(
                      controller: keyword,
                      icon: Icons.search,
                      hint: 'Search by keyword',
                      focusNode: _focus),
                )
              ],
            ),
          ),
          SectionTitleComponent(
            title: 'All Categories',
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CategoryComponent(),
          ),
          SectionTitleComponent(
            title: 'Popular Taste',
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: GridView.count(
              padding: EdgeInsets.all(0),
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              childAspectRatio: 0.7,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: products.map((e) => CardProductComponent()).toList(),
            ),
          )
        ],
      ),
    ));
  }
}
