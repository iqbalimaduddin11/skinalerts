import 'package:flutter/material.dart'; 
import 'package:carousel_slider/carousel_slider.dart';
import 'package:skinalert/home/Clickforcheck.dart';
import 'package:skinalert/home/Diagnosis.dart';
import 'package:skinalert/home/Symptoms.dart'; 

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _vertical = ScrollController();
  int _index = 0; 
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
      backgroundColor: Color(0xFFF2F9F1),
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Set the height of the app bar
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffF2F9F1),
          flexibleSpace: Container(
            padding: EdgeInsets.only(top: 40.0, left: 15.0, right: 15.0), // Adjust the padding as needed
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/Icons/logo2.png'), // Add your profile picture asset here
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
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20), 
            // Carousel Slider
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16/9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
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
            SizedBox(height: 8), // Space between carousel slider and navigation tabs
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
                        backgroundColor: _index == 0 ? MaterialStateProperty.all(Color(0xFF5C715E)) : MaterialStateProperty.all(Color(0xFFF2F9F1)),
                        foregroundColor: _index == 0 ? MaterialStateProperty.all(Color(0xFFF2F9F1)) : MaterialStateProperty.all(Color(0xFF5C715E)),
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
                        backgroundColor: _index == 1 ? MaterialStateProperty.all(Color(0xFF5C715E)) : MaterialStateProperty.all(Color(0xFFF2F9F1)),
                        foregroundColor: _index == 1 ? MaterialStateProperty.all(Color(0xFFF2F9F1)) : MaterialStateProperty.all(Color(0xFF5C715E)),
                      ),
                      child: Text(
                      'Diagnosis And Treatment',
                      style: TextStyle(fontFamily: 'LeagueSpartan', fontSize: 10, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center, // Add this line
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100, // Set the width of the button
                    child: TextButton(
                      onPressed: () {
                        setState(() => _index = 2);
                      },
                      style: ButtonStyle(
                        backgroundColor: _index == 2 ? MaterialStateProperty.all(Color(0xFF5C715E)) : MaterialStateProperty.all(Color(0xFFF2F9F1)),
                        foregroundColor: _index == 2 ? MaterialStateProperty.all(Color(0xFFF2F9F1)): MaterialStateProperty.all(Color(0xFF5C715E)),
                      ),
                      child: Text('Click For Check', style: TextStyle(fontFamily: 'LeagueSpartan',fontSize: 10,fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            // Content Area
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16),
              child: SizedBox(
                height: MediaQuery.of(context).size.height /3.2,
                child: _index == 0
                  ? SymptomsPage()
                  : _index == 1
                    ? DiagnosisPage()
                    : ClickForCheckPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
