import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skinalert/home/floatingNavbar/home.dart';

class ResultPage extends StatelessWidget {
  void _logout(BuildContext context) {
    // AuthService.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  final double combinedCF;
  final Timestamp date;
  final String riskCategory;
  final String description;
  final String fullName;
  

  ResultPage({
    required this.combinedCF,
    required this.date,
    required this.riskCategory,
    required this.description,
    required this.fullName,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F9F1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile section
              Container(
                padding: EdgeInsets.all(16.0),
                color: Color(0xFFF2F9F1), // Background color for profile section
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/Icons/logo2.png'), // Add your profile picture asset here
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi, WelcomeBack',
                              
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF5C715E),
                                fontFamily: 'LeagueSpartan',
                              ),
                            ),
                            Text(
                              fullName, // Display the logged-in user's name
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'LeagueSpartan',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () => _logout(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5C715E),
                        foregroundColor: Color(0xFFF2F9F1),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'LeagueSpartan',
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Logout'),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Card(
                  color: Color(0xFFF2F9F1), // Change the background color to white
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 16),
                        Text(
                          'Nama: $fullName',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'LeagueSpartan',
                            color: Color(0xFF5C715E),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        
                        Text(
                          'Tanggal Pengecekan: ${date.toDate()}',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'LeagueSpartan',
                            color: Color(0xFF5C715E),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 32),
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF5C715E)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Tingkat Resiko Terpapar Kanker Kulit :',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'LeagueSpartan',
                                    color: Color(0xFF5C715E),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '$description',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    fontFamily: 'LeagueSpartan',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 32),
                        Text(
                          'Perlu diperhatikan!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LeagueSpartan',
                            color: Color(0xFF5C715E),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Hasil ini merupakan estimasi berdasarkan jawaban kuesioner dan bukan merupakan diagnosis medis. Penting untuk selalu berkonsultasi dengan tenaga medis profesional untuk penilaian yang akurat dan langkah penanganan yang tepat.',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'LeagueSpartan',
                            color: Color(0xFF5C715E),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16), // Added a SizedBox here for spacing
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyHomePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF5C715E),
                            padding: EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Back to Home',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'LeagueSpartan',
                              color: Color(0xFFF2F9F1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}