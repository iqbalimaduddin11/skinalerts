import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Quisonerpage extends StatefulWidget {
  @override
  _QuisonereState createState() => _QuisonereState();
}

class _QuisonereState extends State<Quisonerpage> with SingleTickerProviderStateMixin {
  final List<String> questions = [
    "Apakah Anda memiliki bintik kecil yang datar dan merah muda?",
    "Apakah Anda memiliki tahi lalat dengan tepi yang rata dan berwarna sama dengan kulit sekitarnya?",
    "Apakah kulit Anda mengelupas tanpa rasa sakit?",
    "Apakah Anda memiliki area kulit yang terasa kasar atau kering tetapi tidak berubah warna?",
    "Apakah Anda memiliki benjolan kecil yang keras tanpa perubahan warna?",
    "Apakah ada area kulit yang berwarna putih, kekuningan, atau lilin?",
    "Apakah Anda memiliki luka di area yang sering terpapar sinar matahari (wajah, telinga, leher, tangan)?",
    "Apakah Anda mengalami perubahan tekstur kulit di sekitar tahi lalat atau lesi?",
    "Apakah Anda memiliki nodul kecil yang mengkilap dan berwarna seperti lilin?",
    "Apakah Anda memiliki lesi datar, bersisik, dan kemerahan yang bisa menjadi keras?",
    "Apakah Anda memiliki tahi lalat baru yang muncul setelah usia dewasa?",
    "Apakah Anda memiliki lesi berwarna kecokelatan atau hitam yang menyerupai tahi lalat?",
    "Apakah tahi lalat Anda terasa gatal atau berdarah?",
    "Apakah Anda memiliki luka yang berdarah atau berkerak?",
    "Apakah tahi lalat Anda memiliki tepi yang tidak teratur, berbagai warna, dan berdiameter lebih dari 6mm?"
  ];

  int currentIndex = 0;
  int yesCount = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  void _answerQuestion(bool answer) {
    setState(() {
      if (answer) {
        yesCount++;
      }
      currentIndex++;
      if (currentIndex < questions.length) {
        _controller.reset();
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progress = currentIndex / questions.length;
    if (currentIndex < questions.length) {
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return CircularPercentIndicator(
                              radius: 130.0,
                              lineWidth: 15.0,
                              percent: currentIndex < questions.length ? progress * _animation.value : 1.0,
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
                        if (currentIndex < questions.length)
                          Column(
                            children: [
                              Text(
                                questions[currentIndex],
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
                            ],
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

void main() {
  runApp(MaterialApp(
    home: Quisonerpage(),
  ));
}
