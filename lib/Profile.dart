<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 79d77bf (first commit)
=======
=======
<<<<<<< HEAD
=======
>>>>>>> 1bc94ab (push branch production)
import 'package:flutter/material.dart'; 
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> aeb3465 (push branch production)
>>>>>>> 5b710bf (push branch production)
=======
import 'package:flutter/material.dart'; 
=======
>>>>>>> 6749efe (push branch production)
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'History.dart';
import 'home.dart';
import 'Team.dart';
<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD
import 'package:flutter/material.dart'; 
>>>>>>> c943860 (update now)
=======
>>>>>>> 79d77bf (first commit)
=======
>>>>>>> 9c3a5ef (first commit)
<<<<<<< HEAD
>>>>>>> aeb3465 (push branch production)
>>>>>>> 5b710bf (push branch production)
=======
>>>>>>> 9c3a5ef (first commit)
>>>>>>> 6749efe (push branch production)
=======
=======
import 'package:firebase_auth/firebase_auth.dart';
>>>>>>> f08f975 (update login & signup page)
<<<<<<< HEAD
>>>>>>> 834b9f3 (update login & signup page)
=======
=======
>>>>>>> 6b1fbb2 (push branch production)
<<<<<<< HEAD
>>>>>>> b74df55 (push branch production)
=======
=======
import 'package:firebase_auth/firebase_auth.dart';
>>>>>>> 9288652 (update login & signup page)
>>>>>>> 229dedd (update login & signup page)

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> { 
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    super.dispose();
  }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 48b3aba (push branch production)
 Future<void> _selectDate(BuildContext context) async {
=======
Future<void> _selectDate(BuildContext context) async {
>>>>>>> 9288652 (update login & signup page)
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData(
          colorScheme: ColorScheme.light(
            primary: Color(0xFF5C715E), 
            onPrimary: Color(0xFFF2F9F1), 
<<<<<<< HEAD
=======
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: Color(0xFF5C715E), 
              onPrimary: Color(0xFFF2F9F1), 
            ),
>>>>>>> f08f975 (update login & signup page)
=======
>>>>>>> 48b3aba (push branch production)
          ),
        ),
        child: child!,
      );
    },
  );
  if (picked != null && picked != DateTime.now()) {
    setState(() {
      _dobController.text = "${picked.toLocal()}".split(' ')[0];
    });
  }
}

<<<<<<< HEAD
=======
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

=======
>>>>>>> 5474dc9 (push update)
=======
=======
=======
<<<<<<< HEAD
=======
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

>>>>>>> aeb3465 (push branch production)
>>>>>>> 5b710bf (push branch production)
=======
>>>>>>> 6749efe (push branch production)
>>>>>>> 241935e (push first project)
>>>>>>> 32e0131 (first commit production)
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
                    backgroundColor: Color(0xFF5C715E),
                    child: Icon(Icons.edit, color: Color(0xFFF2F9F1), size: 20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const ProfileTextField(
                label: 'Full Name',
              ),
              ProfileTextField(
                label: 'Phone Number',
              ),
              ProfileTextField(
                label: 'Email',
              ),
              ProfileTextField(
                label: 'Date Of Birth',
                controller: _dobController,
                onTap: () => _selectDate(context),
              ),
              ProfileDropdownField(
                label: 'Sex',
                items: ['Men', 'Women'],
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
  final TextEditingController? controller;
  final VoidCallback? onTap;

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  const ProfileTextField({super.key, required this.label});
=======
  ProfileTextField({required this.label, this.controller, this.onTap});
>>>>>>> c943860 (update now)
=======
  ProfileTextField({required this.label, this.controller, this.onTap});
=======
  const ProfileTextField({super.key, required this.label});
>>>>>>> 9c3a5ef (first commit)
>>>>>>> 5b710bf (push branch production)
=======
  ProfileTextField({required this.label, this.controller, this.onTap});
>>>>>>> 6749efe (push branch production)
=======
  ProfileTextField({required this.label, this.controller, this.onTap});
=======
  const ProfileTextField({super.key, required this.label});
>>>>>>> 9c3a5ef (first commit)
>>>>>>> b74df55 (push branch production)
=======
  ProfileTextField({required this.label, this.controller, this.onTap});
>>>>>>> 1bc94ab (push branch production)

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
            controller: controller,
            onTap: onTap,
            readOnly: onTap != null,
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
                color: Color(0xFF5C715E),
                fontFamily: 'LeagueSpartan',
              ),
            ),
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
              style: const TextStyle(
=======
            style: TextStyle(
>>>>>>> c943860 (update now)
=======
            style: TextStyle(
=======
              style: const TextStyle(
>>>>>>> 9c3a5ef (first commit)
>>>>>>> 5b710bf (push branch production)
=======
            style: TextStyle(
>>>>>>> 6749efe (push branch production)
=======
            style: TextStyle(
=======
              style: const TextStyle(
>>>>>>> 9c3a5ef (first commit)
>>>>>>> b74df55 (push branch production)
=======
            style: TextStyle(
>>>>>>> 1bc94ab (push branch production)
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

class ProfileDropdownField extends StatefulWidget {
  final String label;
  final List<String> items;

  ProfileDropdownField({required this.label, required this.items});

  @override
  _ProfileDropdownFieldState createState() => _ProfileDropdownFieldState();
}

class _ProfileDropdownFieldState extends State<ProfileDropdownField> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF5C715E),
              fontFamily: 'LeagueSpartan',
            ),
          ),
          SizedBox(height: 8),
          DropdownButtonFormField<String>(
            hint: Text(
              'Select',
            style: TextStyle(
                fontSize: 16,
                color: Color(0xFFF2F9F1),
                fontFamily: 'LeagueSpartan',
              ),),
              icon: Icon(Icons.arrow_drop_down_sharp,color:Color(0xFFF2F9F1),size: 25,),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFF5C715E), 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),   
            ),
            dropdownColor: Color(0xFF5C715E),
            value: selectedValue,
            onChanged: (newValue) {
              setState(() {
                selectedValue = newValue;
              });
            },
            items: widget.items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFF2F9F1),
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
