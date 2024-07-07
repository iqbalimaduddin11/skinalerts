import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skinalert/home.dart';
<<<<<<< HEAD
import 'package:skinalert/loginpage.dart';
// import 'package:skinalert/signup.dart';
=======
import 'package:skinalert/login_or_signup.dart';
>>>>>>> f08f975 (update login & signup page)


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
<<<<<<< HEAD
              // return const LoginPage();
              return const LoginPage();
=======
              return const LoginOrSignUp();
>>>>>>> f08f975 (update login & signup page)
            }
          }
        },
      ),
    );
  }

<<<<<<< HEAD
  void loginWithEmailAndPassword({required email, required String password}) {}
=======
  // void loginWithEmailAndPassword({required email, required String password}) {}
>>>>>>> f08f975 (update login & signup page)


}