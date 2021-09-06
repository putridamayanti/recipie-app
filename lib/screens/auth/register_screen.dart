import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:recipie_flutter/components/input.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  List<Widget> pages = [];
  TextEditingController fullname = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  goToLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.all(30),
          color: Colors.amber,
          child: Container(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: InputComponent(
                    controller: fullname,
                    icon: Icons.person,
                    hint: 'Fullname',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: InputComponent(
                    controller: email,
                    icon: Icons.mail,
                    hint: 'Email Address',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: InputComponent(
                    controller: username,
                    icon: Icons.people,
                    hint: 'Username',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: InputComponent(
                      controller: password,
                      icon: Icons.lock,
                      hint: 'Password',
                      obscureText: true),
                ),
                Container(
                  width: double.infinity,
                  height: 80,
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Register'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade900,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(color: Colors.grey.shade900),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Register',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => goToLogin()),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey.shade800,
          ),
          backgroundColor: Colors.grey.shade50),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
