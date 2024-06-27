import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skinalert/authentication/authentication_wrapper.dart';
import 'package:skinalert/firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

<<<<<<< HEAD
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  
=======
void main() {
>>>>>>> aeb3465 (push branch production)
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkinAlert',
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      home: SplashScreen(),
=======
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const AuthenticationWrapper(),
>>>>>>> d505008 (update feature login)
    );
  }
}

