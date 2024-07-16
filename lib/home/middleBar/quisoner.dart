import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skinalert/home/Result.dart';
import 'package:skinalert/home/floatingNavbar/home1.dart';

class QuisonerPage extends StatefulWidget {
  @override
  _QuisonerPageState createState() => _QuisonerPageState();
}

class _QuisonerPageState extends State<QuisonerPage> with SingleTickerProviderStateMixin {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<Map<String, dynamic>> _questions = [];
  int currentIndex = 0;
  double combinedCF = 0.0;
  String _riskCategory = '';
  Timestamp _date ='dd/mm/yyyy' as Timestamp;
  late AnimationController _controller;
  late Animation<double> _animation;
  String _fullName = '';
  // Timestamp? _dob;
  String? _userId;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _fetchQuestions();
    _fetchFullName();
    _fetchUserId();
  }

  Future<void> _fetchQuestions() async {
    QuerySnapshot querySnapshot = await _firestore.collection('quisioners').get();
    setState(() {
      _questions = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    });
  }

  Future<void> _fetchFullName() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot documentSnapshot = await _firestore.collection('users').doc(user.uid).get();
      setState(() {
        _fullName = documentSnapshot.get('fullName');
        // _dob = documentSnapshot.get('dob');
      });
    }
  }

  Future<void> _fetchUserId() async {
    User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _userId = user.uid;
      });
    }
  }

  void _answerQuestion(bool answer) {
    setState(() {
      if (answer) {
        double bobot = _questions[currentIndex]['bobot'];
        combinedCF = _combineCF(combinedCF, bobot);
      }
      currentIndex++;
      if (currentIndex < _questions.length) {
        _controller.reset();
        _controller.forward();
      } else {
        _riskCategory = _determineRiskCategory(combinedCF);
        _saveResult();
      }
    });
  }

  double _combineCF(double bobot1, double bobot2) {
    return bobot1 + bobot2 * (1 - bobot1);
  }

  String _determineRiskCategory(double combinedCF) {
    if (combinedCF >= 0.0 && combinedCF <= 0.4) {
      return 'Risiko Rendah';
    } else if (combinedCF > 0.4 && combinedCF <= 0.7) {
      return 'Risiko Sedang';
    } else if (combinedCF > 0.7 && combinedCF <= 1.0) {
      return 'Risiko Tinggi';
    } else {
      return 'Nilai CF tidak valid';
    }
  }

  Future<void> _saveResult() async {
    if (_userId != null) {
      await _firestore.collection('results').add({
        'point': combinedCF,
        'description': _riskCategory,
        'date': Timestamp.now(),
        'userId': _userId,
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progress = currentIndex / _questions.length;
    if (currentIndex < _questions.length) {
      _controller.forward();
    }

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
                          _fullName,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return CircularPercentIndicator(
                              radius: 130.0,
                              lineWidth: 15.0,
                              percent: currentIndex < _questions.length? progress * _animation.value : 1.0,
                              center: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Skin\nAlert',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 58,
                                      fontFamily: 'lobster-two',
                                      color: Color(0xFF2C4237),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: Color(0xFFB6CDBD),
                              progressColor: Color(0xFF5C715E),
                            );
                          },
                        ),
                        SizedBox(height: 20),
                        if (currentIndex < _questions.length)
                          Column(
                            children: [
                              Text(
                                _questions[currentIndex]['question'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Color(0xFF5C715E),
                                  fontFamily: 'LeagueSpartan',
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      _answerQuestion(true);
                                    },
                                    child: Text(
                                      'Ya',
                                      style: TextStyle(
                                        fontFamily: 'LeagueSpartan',
                                        color: Color(0xFFF2F9F1),
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF2C4237), // Adjusted color to match the image
                                      minimumSize: Size(100, 50), // Set the size to ensure both buttons are the same
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _answerQuestion(false);
                                    },
                                    child: Text(
                                      'Tidak',
                                      style: TextStyle(
                                        color: Color(0xFFF2F9F1),
                                        fontFamily: 'LeagueSpartan',
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF2C4237), // Adjusted color to match the image
                                      minimumSize: Size(100, 50), // Set the size to ensure both buttons are the same
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        else
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Quisoner Completed!',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'LeagueSpartan',
                                  color: Color(0xFF2C4237), 
                                ),
                              ),
                              SizedBox(height: 20), // add some space between the text and buttons
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ResultPage(combinedCF: combinedCF, 
                                    date: _date,
                                    riskCategory: _riskCategory, description: _riskCategory, 
                                    fullName: _fullName, 
                                    // dob: Timestamp.now(),
                                    )),
                                  );
                                },
                                child: Text('Show The Result'), 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF5C715E),
                                  foregroundColor: Color(0xFFF2F9F1),
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'LeagueSpartan'
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => MyHomePage()),
                                  );
                                },
                                child: Text('Back to Homepage'), 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF5C715E),
                                  foregroundColor: Color(0xFFF2F9F1),
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  textStyle: TextStyle(
                                    fontSize: 16, 
                                    fontFamily: 'LeagueSpartan'
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          )
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
