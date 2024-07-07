import 'package:flutter/material.dart';
import 'package:skinalert/loginpage.dart';
import 'package:skinalert/signup.dart';


class LoginOrSignUp extends StatefulWidget {
  const LoginOrSignUp({super.key});

  @override
  State<LoginOrSignUp> createState() => _LoginOrSignUpState();
}

class _LoginOrSignUpState extends State<LoginOrSignUp> {
  bool islogin = true;

  void togglePage() {
    setState(() {
      islogin = !islogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (islogin) {
      return LoginPage(onPressed: togglePage);
    } else {
      return SignUpPage(onPressed: togglePage);
    }
  }
}