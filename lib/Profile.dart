// ignore: file_names
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F9F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F9F1),
        elevation: 0,
        toolbarHeight: 0, // Hide the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40), // Add some space from the top
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5C715E),
                  fontFamily: 'LeagueSpartan',
                ),
              ),
              const SizedBox(height: 10),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/Icons/logo2.png'), // Add your profile picture asset here
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.edit, color: Color(0xFF5C715E), size: 20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const ProfileTextField(
                label: 'Full Name',
              ),
              const ProfileTextField(
                label: 'Phone Number',
              ),
              const ProfileTextField(
                label: 'Email',
              ),
              const ProfileTextField(
                label: 'Date Of Birth',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFFF2F9F1),
                  backgroundColor: const Color(0xFF5C715E),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Update',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFF2F9F1),
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
              ),
              const SizedBox(height: 40), // Add some space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final String label;

  const ProfileTextField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF5C715E),
              fontFamily: 'LeagueSpartan',
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF5C715E),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              hintStyle: const TextStyle(
                fontSize: 16,
                color: Color(0xFFF2F9F1),
                fontFamily: 'LeagueSpartan',
              ),
            ),
              style: const TextStyle(
              fontSize: 16,
              color: Color(0xFFF2F9F1),
              fontFamily: 'LeagueSpartan',
            ),
          ),
        ],
      ),
    );
  }
}