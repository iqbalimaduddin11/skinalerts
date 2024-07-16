import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuisonerPage extends StatelessWidget {
  const QuisonerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                buildQuestionCard(
                  question: 'Apakah Anda memiliki bintik kecil yang datar dan merah muda?',
                  weight: 0.2,
                  isFirst: true,
                ),
                buildQuestionCard(
                  question: 'Apakah Anda memiliki tahi lalat dengan tepi yang rata dan berwarna sama dengan kulit sekitarnya?',
                  weight: 0.2,
                ),
                buildQuestionCard(
                  question: 'Apakah kulit Anda mengelupas tanpa rasa sakit?',
                  weight: 0.3,
                ),
                buildQuestionCard(
                  question: 'Apakah Anda sering merasa gatal di kulit?',
                  weight: 0.1,
                ),
                buildQuestionCard(
                  question: 'Apakah Anda memiliki luka yang tidak sembuh-sembuh?',
                  weight: 0.4,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF5C715E),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Color(0xFFF2F9F1),
                    ),
                    onPressed: () {
                      // handle edit button press
                    },
                    iconSize: 30.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF5C715E),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Color(0xFFF2F9F1),
                    ),
                    onPressed: () {
                      // handle delete button press
                    },
                    iconSize: 30.0,
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'LeagueSpartan',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(140, 28),
                  foregroundColor: Color(0xFFF2F9F1),
                  backgroundColor: Color(0xFF5C715E),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Reduce the vertical padding
                ),
                onPressed: () {
                  // handle save button press
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildQuestionCard({required String question, required double weight, bool isFirst = false}) {
    return Column(
      children: [
        if (isFirst)
         Align(
          alignment: Alignment.centerLeft,
           child: FittedBox(
             child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start, // Align the content to the left
                  children: [
                    Icon(
                      Icons.add_circle_sharp,
                      color: Color(0xFFF2F9F1), 
                      size: 20  ,
                      ), // Add an edit icon
                    SizedBox(width: 8), // Add a small space between the icon and the text
                    Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'LeagueSpartan',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFFF2F9F1),
                  backgroundColor: Color(0xFF5C715E),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Reduce the vertical padding
                ),
                onPressed: () {
                  // handle save button press
                },
              ),
           ),
         ),
        Card(
          color: Color(0xFFF2F9F1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.black),
          ),
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: Color(0xFFF2F9F1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: const BorderSide(color: Colors.black),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      question,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'LeagueSpartan',
                        color: const Color(0xFF5C715E),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: Color(0xFFF2F9F1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Ya',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'LeagueSpartan',
                                color: const Color(0xFF5C715E),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Card(
                        color: Color(0xFFF2F9F1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Tidak',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'LeagueSpartan',
                                color: const Color(0xFF5C715E),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Text(
                      'Bobot Nilai:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'LeagueSpartan',
                        color: const Color(0xFF5C715E),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Card(
                        color: Color(0xFFF2F9F1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '$weight',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'LeagueSpartan',
                              color: const Color(0xFF5C715E),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}