import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skinalert/home/Result.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> _history = [];
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');
  User? _currentUser;
  String? _fullName;
  //String? _image;

  @override
  void initState() {
    super.initState();
    _fetchHistory();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    final user = FirebaseAuth.instance.currentUser;
    setState(() {
      _currentUser = user;
    });
    if (_currentUser != null) {
      final userDoc = await _usersCollection.doc(_currentUser!.uid).get();
      setState(() {
        _fullName = userDoc.get('fullName');
       //_image = userDoc.get('image');
      });
    }
  }

  Future<void> _fetchHistory() async {
    QuerySnapshot querySnapshot = await _firestore.collection('results').get();
    setState(() {
      _history = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F9F1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                color: Color(0xFFF2F9F1),
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
                          _fullName ?? '',
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
                              color: Color(0xFF5C715E),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 20),
                        if (_history.isEmpty)
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
                              itemCount: _history.length,
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
                                                (_history[index]['date'] as Timestamp).toDate().toString(),
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'LeagueSpartan',
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                'Telah Melakukan Check For Skin Cancer',
                                                style: TextStyle(
                                                  fontSize: 12,
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
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ResultPage(
                                                  combinedCF: _history[index]['combinedCF'] ?? 0.0,
                                                  date: _history[index]['date'],
                                                  riskCategory: _history[index]['riskCategory'] ?? '',
                                                  description: _history[index]['description'] ?? '',
                                                  fullName: _fullName!,
                                                ),
                                              ),
                                            );
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
    );
  }
}