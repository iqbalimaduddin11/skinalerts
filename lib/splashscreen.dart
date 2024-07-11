import 'package:flutter/material.dart';
import 'dart:async';
import 'package:skinalert/user_authentication/loginpage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
            width: 200,
            height: 200,
            margin: EdgeInsets.only(bottom: 30),
            color: Colors.transparent,
            child: Image.asset('assets/Icons/logo.png'),
             ),
            Text(
              'Skin',
              style: TextStyle(
                fontFamily: 'lobster-two', // Use a custom font if available
                fontSize: 58,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C4237),
              ),
            ),
            Text(
              'Alert',
              style: TextStyle(
                fontFamily: 'lobster-two', // Use a custom font if available
                fontSize: 58,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C4237),
              ),
            ),
            SizedBox(height: 20),
            // Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                      RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome ',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Inter-Bold',
                              color: Color(0xFF2C4237),
                            ),
                          ),
                          TextSpan(
                            text: 'SkinAlert Apps,',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Inter-Bold',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2C4237),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Text(
                    'Solusi cerdas untuk deteksi dini kanker kulit.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Inter-Bold',
                      color: Color(0xFF2C4237),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}