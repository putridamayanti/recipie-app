import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipie_flutter/components/input.dart';
import 'package:recipie_flutter/layouts/main_layout.dart';
import 'package:recipie_flutter/screens/onboard/onboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 400), () {
      preferences.then((SharedPreferences prefs) => {
            if (prefs.getBool('first') != null &&
                prefs.getBool('first') == true)
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainLayout(),
                  ),
                )
              }
            else
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OnboardScreen(),
                  ),
                )
              }
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SvgPicture.asset(
        'assets/images/logo1.svg',
        width: 200,
      ),
    ));
  }
}
