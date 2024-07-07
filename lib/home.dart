import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:skinalert/home/Clickforcheck.dart';
import 'package:skinalert/home/Diagnosis.dart';
import 'package:skinalert/home/Symptoms.dart';
import 'package:skinalert/loginpage.dart';
import 'Profile.dart';
import 'Team.dart';
import 'History.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, User? User});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CollectionReference myItems =
      FirebaseFirestore.instance.collection("users");
  final ScrollController _vertical = ScrollController();
  int _index = 0;
  int _indexNavbar = 0;
  final List<String> imgList = [
    'assets/gambar1.jpg', // Replace with your image assets
    'assets/gambar2.jpg',
    'assets/gambar3.jpg',
    'assets/gambar4.jpg',
  ];

  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    final user = FirebaseAuth.instance.currentUser;
    setState(() {
      _currentUser = user;
    });
  }

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  void dispose() {
    _vertical.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F9F1),
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 0, // Hide the app bar
      ),
      body: StreamBuilder(
        stream: myItems.doc(_currentUser?.uid).snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            final userDoc = snapshot.data!;
            return Column(
              children: [
                // Profile section
                Container(
                  padding: const EdgeInsets.all(16.0),
                  color: const Color(0xFFF2F9F1), // Background color for profile section
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: userDoc['image'], // Add your profile picture asset here
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, WelcomeBack',
                            style: TextStyle(fontSize: 16, color: Color(0xFF5C715E), fontFamily: 'LeagueSpartan'),
                          ),
                          Text(
                            userDoc['fullName'],
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'LeagueSpartan'),
                          ),
                        ],
                      ),
                      Spacer(), // Push the logout button to the right
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ElevatedButton(
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
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8), // Space between profile and carousel slider
                // Carousel Slider
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16/9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                  items: imgList.map((item) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF5C715E), width: 2), // Border around images
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Match the border radius
                      child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                    ),
                  )).toList(),
                ),
                const SizedBox(height: 8), // Space between carousel slider and navigation tabs
                // Navigation Tabs
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 100, // Set the width of the button
                        child: TextButton(
                          onPressed: () {
                            setState(() => _index = 0);
                          },
                          style: ButtonStyle(
                            backgroundColor: _index == 0? MaterialStateProperty.all(Color(0xFF5C715E)) : MaterialStateProperty.all(Color(0xFFF2F9F1)),
                            foregroundColor: _index == 0? MaterialStateProperty.all(Color(0xFFF2F9F1)) : MaterialStateProperty.all(Color(0xFF5C715E)),
                          ),
                          child: Text('Symptoms', style: TextStyle(fontFamily: 'LeagueSpartan',fontSize: 10,fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        width: 100, // Set the width of the button
                        child: TextButton(
                          onPressed: () {
                            setState(() => _index = 1);
                          },
                          style: ButtonStyle(
                            backgroundColor: _index == 1? MaterialStateProperty.all(Color(0xFF5C715E)) : MaterialStateProperty.all(Color(0xFFF2F9F1)),
                            foregroundColor: _index == 1? MaterialStateProperty.all(Color(0xFFF2F9F1)) : MaterialStateProperty.all(Color(0xFF5C715E)),
                          ),
                          child: Text('Diagnosis And Treatment', style: TextStyle(fontFamily: 'LeagueSpartan', fontSize: 10,fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        width: 100, // Set the width of the button
                        child: TextButton(
                          onPressed: () {
                            setState(() => _index = 2);
                          },
                          style: ButtonStyle(
                            backgroundColor: _index == 2? MaterialStateProperty.all(Color(0xFF5C715E)) : MaterialStateProperty.all(Color(0xFFF2F9F1)),
                            foregroundColor: _index == 2? MaterialStateProperty.all(Color(0xFFF2F9F1)): MaterialStateProperty.all(Color(0xFF5C715E)),
                          ),
                          child: Text('Click For Check', style: TextStyle(fontFamily: 'LeagueSpartan',fontSize: 10,fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                // Content Area
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16),
                    child: _index == 0
                        ? SymptomsPage()
                        : _index == 1
                            ? DiagnosisPage()
                            : ClickForCheckPage(),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: Container(
        height: 110, // Atur tinggi sesuai kebutuhan untuk menghindari overflow
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