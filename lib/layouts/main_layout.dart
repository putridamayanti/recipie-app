import 'package:flutter/material.dart';
import 'package:recipie_flutter/screens/account/account_screen.dart';
import 'package:recipie_flutter/screens/auth/login_screen.dart';
import 'package:recipie_flutter/screens/explore/explore_screen.dart';
import 'package:recipie_flutter/screens/home/home_screen.dart';
import 'package:recipie_flutter/screens/meal/meal_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  List<Widget> pages = [
    HomeScreen(),
    ExploreScreen(),
    // MealScreen(),
    AccountScreen()
  ];
  int pageIndex = 0;

  Future<Null> setAccountScreen() async {
    preferences.then((SharedPreferences prefs) => {
          print(prefs.getString('token')),
          if (prefs.getString('token') != null)
            {
              setState(() {
                pages.add(AccountScreen());
              })
            }
          else
            {}
        });
  }

  @override
  void initState() {
    super.initState();

    setAccountScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey.shade700,
        showUnselectedLabels: true,
        currentIndex: pageIndex,
        onTap: (index) {
          if (index == 3) {
            preferences.then((SharedPreferences prefs) => {
                  print(prefs.getString('token')),
                  if (prefs.getString('token') == null)
                    {Navigator.pushNamed(context, '/login')}
                  else
                    {
                      setState(() {
                        pageIndex = index;
                      })
                    }
                });
          } else {
            setState(() {
              pageIndex = index;
            });
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          // BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Meal'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Account')
        ],
      ),
    );
  }
}
