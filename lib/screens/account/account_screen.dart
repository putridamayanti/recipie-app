import 'package:flutter/material.dart';
import 'package:recipie_flutter/components/card_product.dart';
import 'package:recipie_flutter/screens/account/components/account_info.dart';
import 'package:recipie_flutter/screens/recipe/form_recipe_screen.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<int> products = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(handleTabSelection);

    super.initState();
  }

  handleTabSelection() {
    if (tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        AccountInfo(),
        TabBar(
            controller: tabController,
            indicatorColor: Colors.amber,
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.grey.shade600,
            tabs: [
              Container(
                height: 50,
                child: Tab(
                  text: 'My Recipe',
                ),
              ),
              Container(
                height: 30,
                child: Tab(
                  text: 'Favorites',
                ),
              ),
            ]),
        Container(
            height: MediaQuery.of(context).size.height - 342,
            child: [
              GridView.count(
                padding: EdgeInsets.all(20),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                childAspectRatio: 0.7,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormRecipeScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
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
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 50,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                  ...products.map((e) => CardProductComponent()).toList()
                ],
              ),
              GridView.count(
                padding: EdgeInsets.all(20),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                childAspectRatio: 0.7,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: products.map((e) => CardProductComponent()).toList(),
              ),
            ][tabController.index]),
      ],
    ));
  }
}
