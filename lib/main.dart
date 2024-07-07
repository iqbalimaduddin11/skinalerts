import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skinalert/authentication/authentication_wrapper.dart';
import 'package:skinalert/firebase_options.dart';

<<<<<<< HEAD
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
<<<<<<< HEAD

<<<<<<< HEAD
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  
=======
void main() {
>>>>>>> aeb3465 (push branch production)
=======
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
>>>>>>> f08f975 (update login & signup page)
  runApp(const MyApp());
=======

void main() {
<<<<<<< HEAD
  runApp(MyApp());
>>>>>>> 6b1fbb2 (push branch production)
=======
  runApp(const MyApp());
>>>>>>> 9288652 (update login & signup page)
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkinAlert',
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
<<<<<<< HEAD
      home: SplashScreen(),
=======
=======
>>>>>>> f08f975 (update login & signup page)
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const AuthenticationWrapper(),
<<<<<<< HEAD
>>>>>>> d505008 (update feature login)
=======
>>>>>>> f08f975 (update login & signup page)
    );
  }
}