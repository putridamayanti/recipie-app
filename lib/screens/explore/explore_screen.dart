import 'package:flutter/material.dart';
import 'package:recipie_flutter/components/card_product.dart';
import 'package:recipie_flutter/components/input.dart';
import 'package:recipie_flutter/screens/explore/search_screen.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<Widget> pages = [];
  TextEditingController keyword = new TextEditingController();
  List<int> products = [1, 2, 3, 4, 5, 6];
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
                      hint: 'Search by keyword',
                      focusNode: _focus,
                    ),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Taste',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.grey.shade600,
                      ),
                    ])),
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
      ),
    );
  }
}
