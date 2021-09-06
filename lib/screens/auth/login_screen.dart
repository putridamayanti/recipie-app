import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:recipie_flutter/components/alert.dart';
import 'package:recipie_flutter/components/input.dart';
import 'package:recipie_flutter/api/auth_service.dart';
import 'package:recipie_flutter/layouts/main_layout.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<Widget> pages = [];
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool loading = false;
  bool success = false;
  bool error = false;

  goToRegister() {
    Navigator.pushReplacementNamed(context, '/register');
  }

  handleLogin() async {
    setState(() {
      loading = true;
    });

    final result = await AuthService()
        .login({'username': username.text, 'password': password.text});

    if (result.success) {
      setState(() {
        success = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainLayout(),
        ),
      );
    }

    setState(() {
      loading = false;
    });
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
                    'Login',
                    style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: success == true
                      ? Alert(
                          text: 'Successfully login!',
                          type: ALERT_SUCCESS,
                        )
                      : null,
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
                    onPressed: () {
                      handleLogin();
                    },
                    child: loading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text('Login'),
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
                      text: 'Don not have an account? ',
                      style: TextStyle(color: Colors.grey.shade900),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Register here',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  Navigator.pushNamed(context, '/register')),
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
