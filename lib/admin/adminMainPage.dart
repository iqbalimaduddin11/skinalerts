import 'package:flutter/material.dart';
import 'package:skinalert/admin/AuthService.dart';
import 'package:skinalert/home/middleBar/quisoner.dart';
import 'Symptoms.dart';
import 'Diagnosis.dart';

class AdminMainPage extends StatefulWidget {
  final User user;

  const AdminMainPage({Key? key, required this.user}) : super(key: key);

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  int _index = 0; // State variable to keep track of selected tab

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildSymptomsPage(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavButton(0, 'Symptoms', screenWidth),
            _buildNavButton(1, 'Diagnosis And Treatment', screenWidth),
            _buildNavButton(2, 'Quisioner', screenWidth),
          ],
        ),
        SizedBox(height: 10),
        Expanded(
          child: IndexedStack(
            index: _index,
            children: [
              SymptomsPage(),
              DiagnosisPage(),
              QuisonerPage(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavButton(int index, String title, double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.25, // Set the width relative to screen size
      child: TextButton(
        onPressed: () {
          setState(() => _index = index);
        },
        style: ButtonStyle(
          backgroundColor: _index == index
              ? MaterialStateProperty.all(Color(0xFF5C715E))
              : MaterialStateProperty.all(Color(0xFFF2F9F1)),
          foregroundColor: _index == index
              ? MaterialStateProperty.all(Color(0xFFF2F9F1))
              : MaterialStateProperty.all(Color(0xFF5C715E)),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10, horizontal: 15)),
          textStyle: MaterialStateProperty.all(TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 10,
            fontWeight: FontWeight.bold,
          )),
        ),
        child: Text(title),
      ),
    );
  }

  void _logout() {
    AuthService.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F9F1),
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Set the height of the app bar
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffF2F9F1),
          flexibleSpace: Container(
            padding: EdgeInsets.only(top: 40.0, left: 15.0, right: 15.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/Icons/logo2.png'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hi, WelcomeBack',
                      style: TextStyle(fontSize: 16, color: Color(0xFF5C715E), fontFamily: 'LeagueSpartan'),
                    ),
                    Text(
                      'John Doe',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'LeagueSpartan'),
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: _logout,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5C715E),
                    foregroundColor: Color(0xFFF2F9F1),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    textStyle: TextStyle(
                      fontSize: 12, 
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LeagueSpartan'
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Logout'),
                ),
                SizedBox(width: 10), // Add space between icons
              ],
            ),
          ),
        ),
      ),
      body: buildSymptomsPage(context),
    );
  }
}