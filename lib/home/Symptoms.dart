import 'package:flutter/material.dart';

class SymptomsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF2F9F1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.black),
      ),
      child: SizedBox(
        height: 350,
        child: Scrollbar(
          thickness: 10, 
          trackVisibility: true,
          radius: const Radius.circular(3),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    'Symptoms of Skin Cancer\n(Gejala Kanker Kulit)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LeagueSpartan',
                      color: const Color(0xFF5C715E),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Gejala atau tanda kanker kulit umumnya muncul pada bagian tubuh yang sering terpapar sinar matahari, seperti kulit kepala, wajah, telinga, leher, lengan, atau tungkai. Akan tetapi, kanker kulit juga dapat terjadi di bagian tubuh yang jarang terkena sinar matahari, seperti telapak tangan, kaki, atau bahkan area kelamin.\n',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'LeagueSpartan',
                    color: const Color(0xFF5C715E),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
