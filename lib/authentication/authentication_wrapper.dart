import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skinalert/home/floatingNavbar/home.dart';
import 'package:skinalert/user_authentication/login_or_signup.dart';


class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              return MyHomePage(User: snapshot.data);
            } else {
              return const LoginOrSignUp();
            }
          }
        },
      ),
    );
  }

  void loginWithEmailAndPassword({required email, required String password}) {}

}
