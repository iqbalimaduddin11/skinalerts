import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Future<void> signup({
    required String email,
    required String password
  })
  async {
    try {
      
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );

    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is to0 weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exist with that email.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14
      );
    }
  }
  Future<void> loginpage({
    required String email,
    required String password, 
    required BuildContext context
  })
  async {
    try {
      
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );

    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14
      );
    }
  }
}