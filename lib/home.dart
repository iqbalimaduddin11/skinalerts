import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:skinalert/Clickforcheck.dart';
import 'package:skinalert/Diagnosis.dart';
import 'package:skinalert/Symptoms.dart';
import 'Profile.dart';
import 'Team.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _vertical = ScrollController();
  int _index = 0;
  int _indexNavbar = 0;
  final List<String> imgList = [
    'assets/gambar1.jpg', // Replace with your image assets
    'assets/gambar2.jpg',
    'assets/gambar3.jpg',
    'assets/gambar4.jpg',
  ];

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
      body: Column(
        children: [
          // Profile section
          Container(
            padding: const EdgeInsets.all(16.0),
            color: const Color(0xFFF2F9F1), // Background color for profile section
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: const AssetImage('assets/Icons/logo2.png'), // Add your profile picture asset here
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
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
              child: Center(
                child: Image.asset(item, fit: BoxFit.cover, width: 1000)
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
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() => _index = 0);
                    },
                    child: Text('Symptoms', style: TextStyle(fontFamily: 'LeagueSpartan', color: _index == 0 ? const Color(0xFF5C715E) : const Color(0xFF5C715E))),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() => _index = 1);
                    },
                    child: Text('Diagnosis And Treatment', style: TextStyle(fontFamily: 'LeagueSpartan', color: _index == 1 ? const Color(0xFF5C715E) : const Color(0xFF5C715E))),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() => _index = 2);
                    },
                    child: Text('Click For Check', style: TextStyle(fontFamily: 'LeagueSpartan', color: _index == 2 ? const Color(0xFF5C715E) : const Color(0xFF5C715E))),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          // Content Area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _index == 0
                ? SymptomsPage()
                : _index == 1
                  ? DiagnosisPage()
                  : ClickForCheckPage(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 110, // Atur tinggi sesuai kebutuhan untuk menghindari overflow
        child: FloatingNavbar(
          onTap: (int val) {
            setState(() => _indexNavbar = val);
            if (val == 2) {
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
          backgroundColor: const Color(0xFF5C715E),
          selectedItemColor: Colors.black,
          unselectedItemColor: const Color(0xFFF2F9F1),
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