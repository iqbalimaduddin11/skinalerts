import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'home.dart';
import 'Profile.dart';
import 'Team.dart';

class Historypage extends StatefulWidget {
  @override
  _HistorypageState createState() => _HistorypageState();
}

class _HistorypageState extends State<Historypage> {
  final List<Map<String, String>> history = [
    {
      'date': '12 April 2023 | 22:00 WIB',
      'description': 'Telah Melakukan Check For Skin Cancer'
    },
    {
      'date': '10 Feb 2024 | 08:00 WIB',
      'description': 'Telah Melakukan Check For Skin Cancer'
    },
    {
      'date': '12 Juni 2024 | 13:00 WIB',
      'description': 'Telah Melakukan Check For Skin Cancer'
    },
  ];
  int _indexNavbar = 1; // Default to the History page

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
                          'John Doe',
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
              ),
              SizedBox(height: 20),
              Expanded(
                child: Card(
                  color: Color(0xFFF2F9F1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'My History',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'LeagueSpartan',
                              color: Color(0xFF5C715E), // Add green color
                            ),
                            textAlign: TextAlign.center, // Center the text
                          ),
                        ),
                        SizedBox(height: 20),
                        if (history.isEmpty)
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/Icons/logo3.png'),
                                SizedBox(height: 20),
                                Text(
                                  'Belum Ada Riwayat Pengecekan Kanker Kulit',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF5C715E),
                                    fontFamily: 'LeagueSpartan',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        else
                          Expanded(
                            child: ListView.builder(
                              itemCount: history.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  margin: EdgeInsets.only(bottom: 16),
                                  color: Color(0xFFD7E8DA),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/Icons/logo1.png',
                                          height: 50,
                                          width: 50,
                                        ),
                                        SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                history[index]['date']!,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'LeagueSpartan',
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                history[index]['description']!,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'LeagueSpartan',
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Add your onPressed code here!
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF5C715E),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18),
                                            ),
                                          ),
                                          child: Text(
                                            'Lihat Hasil',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFFF2F9F1), 
                                              fontFamily: 'LeagueSpartan', 
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
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
      bottomNavigationBar: Container(
        height: 110, // Adjust height as needed to avoid overflow
        child: FloatingNavbar(
          onTap: (int val) {
            setState(() => _indexNavbar = val);
            if (val == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            } else if (val == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Historypage()),
              );
            } else if (val == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            } else if (val == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProjectTeamPage()),
              );
            }
          },
          currentIndex: _indexNavbar,
          backgroundColor: Color(0xFF5C715E),
          selectedItemColor: Colors.black,
          unselectedItemColor: Color(0xFFF2F9F1),
          items: [
            FloatingNavbarItem(icon: Icons.home),
            FloatingNavbarItem(icon: Icons.history),
            FloatingNavbarItem(icon: Icons.person_outline),
            FloatingNavbarItem(icon: Icons.info_outline),
          ],
        ),
      ),
    );
  }
}