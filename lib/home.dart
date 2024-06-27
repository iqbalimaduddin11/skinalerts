<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
<<<<<<< HEAD
import 'package:skinalert/Clickforcheck.dart';
import 'package:skinalert/Diagnosis.dart';
import 'package:skinalert/Symptoms.dart';
=======
import 'package:skinalert/home/Clickforcheck.dart';
import 'package:skinalert/home/Diagnosis.dart';
import 'package:skinalert/home/Symptoms.dart';
>>>>>>> 79d77bf (first commit)
import 'Profile.dart';
import 'Team.dart';
// ignore: unused_import
import 'History.dart';

class MyHomePage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const MyHomePage({super.key, User? User});
=======
=======
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
>>>>>>> f08f975 (update login & signup page)
import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:skinalert/home/Clickforcheck.dart';
import 'package:skinalert/home/Diagnosis.dart';
import 'package:skinalert/home/Symptoms.dart';
import 'package:skinalert/loginpage.dart';
=======
import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:skinalert/Clickforcheck.dart';
import 'package:skinalert/Diagnosis.dart';
import 'package:skinalert/Symptoms.dart';
>>>>>>> 6b1fbb2 (push branch production)
import 'Profile.dart';
import 'Team.dart';
import 'History.dart';

class MyHomePage extends StatefulWidget {
<<<<<<< HEAD
<<<<<<< HEAD
  const MyHomePage({super.key});
>>>>>>> aeb3465 (push branch production)
=======
  const MyHomePage({super.key, User? User});
>>>>>>> f08f975 (update login & signup page)
=======
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:skinalert/Clickforcheck.dart';
// import 'package:skinalert/Diagnosis.dart';
// import 'package:skinalert/Symptoms.dart';
// import 'Profile.dart';
// import 'Team.dart';
// // ignore: unused_import
// import 'History.dart';

// class MyHomePage extends StatefulWidget {
//   // ignore: non_constant_identifier_names
//   const MyHomePage({super.key, User? User});
>>>>>>> ab4caa1 (merging local branch)

//   @override
//   // ignore: library_private_types_in_public_api
//   _MyHomePageState createState() => _MyHomePageState();
// }

<<<<<<< HEAD
class _MyHomePageState extends State<MyHomePage> {
  final CollectionReference myItems =
      FirebaseFirestore.instance.collection("users");
=======
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
>>>>>>> 6b1fbb2 (push branch production)
  final ScrollController _vertical = ScrollController();
  int _index = 0;
  int _indexNavbar = 0;
  final List<String> imgList = [
    'assets/gambar1.jpg', // Replace with your image assets
    'assets/gambar2.jpg',
    'assets/gambar3.jpg',
    'assets/gambar4.jpg',
  ];
<<<<<<< HEAD
<<<<<<< HEAD
  
  get child => null;
=======
>>>>>>> aeb3465 (push branch production)

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
=======
// class _MyHomePageState extends State<MyHomePage> {
//   final ScrollController _vertical = ScrollController();
//   int _index = 0;
//   int _indexNavbar = 0;
//   final List<String> imgList = [
//     'assets/gambar1.jpg', // Replace with your image assets
//     'assets/gambar2.jpg',
//     'assets/gambar3.jpg',
//     'assets/gambar4.jpg',
//   ];
  
//   get child => null;
>>>>>>> ab4caa1 (merging local branch)

//   @override
//   void dispose() {
//     _vertical.dispose();
//     super.dispose();
//   }

<<<<<<< HEAD
=======

  @override
  void dispose() {
    _vertical.dispose();
    super.dispose();
  }

>>>>>>> 6b1fbb2 (push branch production)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F9F1),
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 0, // Hide the app bar
      ),
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 6b1fbb2 (push branch production)
      body: Column(
        children: [
          // Profile section
          Container(
            padding: const EdgeInsets.all(16.0),
            color: const Color(0xFFF2F9F1), // Background color for profile section
<<<<<<< HEAD
<<<<<<< HEAD
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/Icons/logo2.png'), // Add your profile picture asset here
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
=======
=======
>>>>>>> 6b1fbb2 (push branch production)
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
<<<<<<< HEAD
>>>>>>> aeb3465 (push branch production)
=======
>>>>>>> 6b1fbb2 (push branch production)
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
              decoration: BoxDecoration(
<<<<<<< HEAD
<<<<<<< HEAD
                border: Border.all(color: const Color(0xFF5C715E), width: 2), // Border around images
=======
                border: Border.all(color: Color(0xFF5C715E), width: 2), // Border around images
>>>>>>> aeb3465 (push branch production)
=======
                border: Border.all(color: Color(0xFF5C715E), width: 2), // Border around images
>>>>>>> 6b1fbb2 (push branch production)
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                    child: Text('Symptoms', style: TextStyle(fontFamily: 'LeagueSpartan', color: _index == 0 ? const Color(0xFF5C715E) : const Color(0xFF5C715E))),
=======
=======
>>>>>>> 79d77bf (first commit)
=======
>>>>>>> 32e0131 (first commit production)
=======
>>>>>>> 6749efe (push branch production)
=======
=======
<<<<<<< HEAD
>>>>>>> 6b1fbb2 (push branch production)
>>>>>>> b74df55 (push branch production)
                    style: ButtonStyle(
                      backgroundColor: _index == 0 ? MaterialStateProperty.all(Color(0xFF5C715E)) : MaterialStateProperty.all(Color(0xFFF2F9F1)),
                      foregroundColor: _index == 0 ? MaterialStateProperty.all(Color(0xFFF2F9F1)) : MaterialStateProperty.all(Color(0xFF5C715E)),
                    ),
                    child: Text('Symptoms', style: TextStyle(fontFamily: 'LeagueSpartan',fontSize: 10,fontWeight: FontWeight.bold)),
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 5474dc9 (push update)
=======
>>>>>>> 79d77bf (first commit)
=======
=======
                    child: Text('Symptoms', style: TextStyle(fontFamily: 'LeagueSpartan', color: _index == 0 ? const Color(0xFF5C715E) : const Color(0xFF5C715E))),
>>>>>>> 241935e (push first project)
>>>>>>> 32e0131 (first commit production)
=======
>>>>>>> 6749efe (push branch production)
                  ),
                ),
                SizedBox(
                  width: 100, // Set the width of the button
                  child: TextButton(
                    onPressed: () {
                      setState(() => _index = 1);
                    },
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                    child: Text('Diagnosis And Treatment', style: TextStyle(fontFamily: 'LeagueSpartan', color: _index == 1 ? const Color(0xFF5C715E) : const Color(0xFF5C715E))),
=======
=======
>>>>>>> 79d77bf (first commit)
=======
>>>>>>> 32e0131 (first commit production)
=======
>>>>>>> 6749efe (push branch production)
                    style: ButtonStyle(
                      backgroundColor: _index == 1 ? MaterialStateProperty.all(Color(0xFF5C715E)) : MaterialStateProperty.all(Color(0xFFF2F9F1)),
                      foregroundColor: _index == 1 ? MaterialStateProperty.all(Color(0xFFF2F9F1)) : MaterialStateProperty.all(Color(0xFF5C715E)),
                    ),
                    child: Text('Diagnosis And Treatment', style: TextStyle(fontFamily: 'LeagueSpartan', fontSize: 10,fontWeight: FontWeight.bold)),
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 5474dc9 (push update)
=======
>>>>>>> 79d77bf (first commit)
=======
=======
                    child: Text('Diagnosis And Treatment', style: TextStyle(fontFamily: 'LeagueSpartan', color: _index == 1 ? const Color(0xFF5C715E) : const Color(0xFF5C715E))),
>>>>>>> 241935e (push first project)
>>>>>>> 32e0131 (first commit production)
=======
>>>>>>> 6749efe (push branch production)
                  ),
                ),
                SizedBox(
                  width: 100, // Set the width of the button
                  child: TextButton(
                    onPressed: () {
                      setState(() => _index = 2);
                    },
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                    child: Text('Click For Check', style: TextStyle(fontFamily: 'LeagueSpartan', color: _index == 2 ? const Color(0xFF5C715E) : const Color(0xFF5C715E))),
=======
=======
>>>>>>> 79d77bf (first commit)
=======
>>>>>>> 32e0131 (first commit production)
=======
>>>>>>> 6749efe (push branch production)
                    style: ButtonStyle(
                      backgroundColor: _index == 2 ? MaterialStateProperty.all(Color(0xFF5C715E)) : MaterialStateProperty.all(Color(0xFFF2F9F1)),
                      foregroundColor: _index == 2 ? MaterialStateProperty.all(Color(0xFFF2F9F1)): MaterialStateProperty.all(Color(0xFF5C715E)),
                    ),
                    child: Text('Click For Check', style: TextStyle(fontFamily: 'LeagueSpartan',fontSize: 10,fontWeight: FontWeight.bold)),
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 5474dc9 (push update)
=======
>>>>>>> 79d77bf (first commit)
=======
=======
                    child: Text('Click For Check', style: TextStyle(fontFamily: 'LeagueSpartan', color: _index == 2 ? const Color(0xFF5C715E) : const Color(0xFF5C715E))),
>>>>>>> 241935e (push first project)
>>>>>>> 32e0131 (first commit production)
=======
>>>>>>> 6749efe (push branch production)
=======
=======
<<<<<<< HEAD
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
>>>>>>> f08f975 (update login & signup page)
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
>>>>>>> 834b9f3 (update login & signup page)
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
<<<<<<< HEAD
      bottomNavigationBar: SizedBox(
=======
      bottomNavigationBar: Container(
>>>>>>> aeb3465 (push branch production)
=======
                    child: Text('Symptoms', style: TextStyle(fontFamily: 'LeagueSpartan', color: _index == 0 ? const Color(0xFF5C715E) : const Color(0xFF5C715E))),
>>>>>>> 241935e (push first project)
                  ),
                ),
                SizedBox(
                  width: 100, // Set the width of the button
                  child: TextButton(
                    onPressed: () {
                      setState(() => _index = 1);
                    },
<<<<<<< HEAD
                    style: ButtonStyle(
                      backgroundColor: _index == 1 ? MaterialStateProperty.all(Color(0xFF5C715E)) : MaterialStateProperty.all(Color(0xFFF2F9F1)),
                      foregroundColor: _index == 1 ? MaterialStateProperty.all(Color(0xFFF2F9F1)) : MaterialStateProperty.all(Color(0xFF5C715E)),
                    ),
                    child: Text('Diagnosis And Treatment', style: TextStyle(fontFamily: 'LeagueSpartan', fontSize: 10,fontWeight: FontWeight.bold)),
=======
                    child: Text('Diagnosis And Treatment', style: TextStyle(fontFamily: 'LeagueSpartan', color: _index == 1 ? const Color(0xFF5C715E) : const Color(0xFF5C715E))),
>>>>>>> 241935e (push first project)
                  ),
                ),
                SizedBox(
                  width: 100, // Set the width of the button
                  child: TextButton(
                    onPressed: () {
                      setState(() => _index = 2);
                    },
<<<<<<< HEAD
                    style: ButtonStyle(
                      backgroundColor: _index == 2 ? MaterialStateProperty.all(Color(0xFF5C715E)) : MaterialStateProperty.all(Color(0xFFF2F9F1)),
                      foregroundColor: _index == 2 ? MaterialStateProperty.all(Color(0xFFF2F9F1)): MaterialStateProperty.all(Color(0xFF5C715E)),
                    ),
                    child: Text('Click For Check', style: TextStyle(fontFamily: 'LeagueSpartan',fontSize: 10,fontWeight: FontWeight.bold)),
=======
                    child: Text('Click For Check', style: TextStyle(fontFamily: 'LeagueSpartan', color: _index == 2 ? const Color(0xFF5C715E) : const Color(0xFF5C715E))),
>>>>>>> 241935e (push first project)
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
      ),
      bottomNavigationBar: Container(
>>>>>>> 6b1fbb2 (push branch production)
        height: 110, // Atur tinggi sesuai kebutuhan untuk menghindari overflow
        child: FloatingNavbar(
          onTap: (int val) {
            setState(() => _indexNavbar = val);
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
            if (val == 2) {
=======
=======
>>>>>>> 79d77bf (first commit)
=======
>>>>>>> 32e0131 (first commit production)
=======
>>>>>>> 6749efe (push branch production)
=======
=======
<<<<<<< HEAD
>>>>>>> 6b1fbb2 (push branch production)
>>>>>>> b74df55 (push branch production)
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 5474dc9 (push update)
=======
>>>>>>> 79d77bf (first commit)
=======
>>>>>>> b74df55 (push branch production)
=======
=======
            if (val == 2) {
>>>>>>> 241935e (push first project)
<<<<<<< HEAD
>>>>>>> 32e0131 (first commit production)
=======
>>>>>>> 6749efe (push branch production)
=======
>>>>>>> 6b1fbb2 (push branch production)
>>>>>>> b74df55 (push branch production)
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
          backgroundColor: const Color(0xFF5C715E),
          selectedItemColor: Colors.black,
          unselectedItemColor: const Color(0xFFF2F9F1),
=======
          backgroundColor: Color(0xFF5C715E),
          selectedItemColor: Colors.black,
          unselectedItemColor: Color(0xFFF2F9F1),
>>>>>>> 5474dc9 (push update)
=======
          backgroundColor: Color(0xFF5C715E),
          selectedItemColor: Colors.black,
          unselectedItemColor: Color(0xFFF2F9F1),
>>>>>>> 79d77bf (first commit)
=======
=======
          backgroundColor: Color(0xFF5C715E),
          selectedItemColor: Colors.black,
          unselectedItemColor: Color(0xFFF2F9F1),
=======
<<<<<<< HEAD
>>>>>>> b74df55 (push branch production)
          backgroundColor: Color(0xFF5C715E),
          selectedItemColor: Colors.black,
          unselectedItemColor: Color(0xFFF2F9F1),
=======
          backgroundColor: const Color(0xFF5C715E),
          selectedItemColor: Colors.black,
          unselectedItemColor: const Color(0xFFF2F9F1),
>>>>>>> 241935e (push first project)
<<<<<<< HEAD
>>>>>>> 32e0131 (first commit production)
=======
          backgroundColor: Color(0xFF5C715E),
          selectedItemColor: Colors.black,
          unselectedItemColor: Color(0xFFF2F9F1),
>>>>>>> 6749efe (push branch production)
=======
>>>>>>> 6b1fbb2 (push branch production)
>>>>>>> b74df55 (push branch production)
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
<<<<<<< HEAD
=======
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF2F9F1),
//       extendBody: true,
//       appBar: AppBar(
//         toolbarHeight: 0, // Hide the app bar
//       ),
//       body: Column(
//         children: [
//           // Profile section
//           Container(
//             padding: const EdgeInsets.all(16.0),
//             color: const Color(0xFFF2F9F1), // Background color for profile section
//             child: const Row(
//               children: [
//                 CircleAvatar(
//                   radius: 30,
//                   backgroundImage: AssetImage('assets/Icons/logo2.png'), // Add your profile picture asset here
//                 ),
//                 SizedBox(width: 16),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Hi, WelcomeBack',
//                       style: TextStyle(fontSize: 16, color: Color(0xFF5C715E), fontFamily: 'LeagueSpartan'),
//                     ),
//                     Text(
//                       'John Doe',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'LeagueSpartan'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 8), // Space between profile and carousel slider
//           // Carousel Slider
//           CarouselSlider(
//             options: CarouselOptions(
//               height: 200.0,
//               enlargeCenterPage: true,
//               autoPlay: true,
//               aspectRatio: 16/9,
//               autoPlayCurve: Curves.fastOutSlowIn,
//               enableInfiniteScroll: true,
//               autoPlayAnimationDuration: const Duration(milliseconds: 800),
//               viewportFraction: 0.8,
//             ),
//             items: imgList.map((item) => Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: const Color(0xFF5C715E), width: 2), // Border around images
//                 borderRadius: BorderRadius.circular(10), // Rounded corners
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10), // Match the border radius
//                 child: Image.asset(item, fit: BoxFit.cover, width: 1000),
//               ),
//             )).toList(),
//           ),
//           const SizedBox(height: 8), // Space between carousel slider and navigation tabs
//           // Navigation Tabs
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 SizedBox(
//                   width: 100, // Set the width of the button
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() => _index = 0);
//                     },
//                     child: Text('Symptoms', style: TextStyle(fontFamily: 'LeagueSpartan', color: _index == 0 ? const Color(0xFF5C715E) : const Color(0xFF5C715E))),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 100, // Set the width of the button
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() => _index = 1);
//                     },
//                     child: Text('Diagnosis And Treatment', style: TextStyle(fontFamily: 'LeagueSpartan', color: _index == 1 ? const Color(0xFF5C715E) : const Color(0xFF5C715E))),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 100, // Set the width of the button
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() => _index = 2);
//                     },
//                     child: Text('Click For Check', style: TextStyle(fontFamily: 'LeagueSpartan', color: _index == 2 ? const Color(0xFF5C715E) : const Color(0xFF5C715E))),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const Divider(),
//           // Content Area
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16),
//               child: _index == 0
//                 ? SymptomsPage()
//                 : _index == 1
//                   ? DiagnosisPage()
//                   : ClickForCheckPage(),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: SizedBox(
//         height: 110, // Atur tinggi sesuai kebutuhan untuk menghindari overflow
//         child: FloatingNavbar(
//           onTap: (int val) {
//             setState(() => _indexNavbar = val);
//             if (val == 2) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ProfilePage()),
//               );
//             } else if (val == 3) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ProjectTeamPage()),
//               );
//             }
//           },
//           currentIndex: _indexNavbar,
//           backgroundColor: const Color(0xFF5C715E),
//           selectedItemColor: Colors.black,
//           unselectedItemColor: const Color(0xFFF2F9F1),
//           items: [
//             FloatingNavbarItem(icon: Icons.home),
//             FloatingNavbarItem(icon: Icons.history),
//             FloatingNavbarItem(icon: Icons.person_outline),
//             FloatingNavbarItem(icon: Icons.info_outline),
//           ],
//         ),
//       ),
//     );
//   }
// }
>>>>>>> ab4caa1 (merging local branch)
=======
>>>>>>> 6b1fbb2 (push branch production)
