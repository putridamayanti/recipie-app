import 'package:flutter/material.dart';
import 'package:recipie_flutter/layouts/main_layout.dart';
import 'package:recipie_flutter/screens/onboard/components/firststep.dart';
import 'package:recipie_flutter/screens/onboard/components/secondstep.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardScreen extends StatefulWidget {
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  List<String> pages = ['Recipe', 'Meal'];

  late PageController pageController;
  int initialPage = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: initialPage);

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  handleChangePage(index) {
    if (index < 2) {
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 400), curve: Curves.easeIn);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainLayout(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          FirstStepComponent(
            onTap: () {
              handleChangePage(1);
            },
          ),
          SecondStepComponent(onTap: () {
            handleChangePage(2);
          })
        ],
      ),
    );
  }
}
