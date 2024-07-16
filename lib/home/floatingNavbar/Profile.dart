import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  File? _image;
  String? _uploadedImageUrl;

  @override
  void dispose() {
    _fullNameController.dispose();
    _mobileNumberController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    super.dispose();
  }

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

  Future<void> _selectImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        _image = null;
      }
    });
  }

  Future<void> _updateProfile() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user!= null) {
        if (_image!= null) {
          _uploadedImageUrl = await uploadImage(_image!);
        }

        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'fullName': _fullNameController.text,
          'mobileNumber': _mobileNumberController.text,
          'email': _emailController.text,
          'dob': _dobController.text,
          if (_uploadedImageUrl!= null) 'image': _uploadedImageUrl,
          'userId': user.uid, // Add this line to keep the user_id field
        }, SetOptions(merge: true));

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile updated successfully')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No user is signed in')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update profile: $e')));
    }
  }

  Future<String?> uploadImage(File image) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final uploadTask = storageRef.child('users/${FirebaseAuth.instance.currentUser!.uid}/profile_image').putFile(image);
      final snapshot = await uploadTask.whenComplete(() => null);
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print('Failed to upload image: $e');
      return null;
    }
  }

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
              CircleAvatar(
                radius: 50,
                backgroundImage: _image != null ? FileImage(_image!) : null,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Color(0xFF5C715E),
                    child: ElevatedButton(
                      onPressed: _selectImage,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFFF2F9F1),
                        backgroundColor: const Color(0xFF5C715E),
                        padding: const EdgeInsets.all(8),
                        shape: CircleBorder(),
                      ),
                      child: Icon(Icons.edit, color: Color(0xFFF2F9F1), size: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ProfileTextField(
                label: 'Full Name',
                controller: _fullNameController,
              ),
              ProfileTextField(
                label: 'Phone Number',
                controller: _mobileNumberController,
              ),
              ProfileTextField(
                label: 'Email',
                controller: _emailController,
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
                onPressed: _updateProfile,
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

  ProfileTextField({required this.label, this.controller, this.onTap});

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
            readOnly: onTap!= null,
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
            style: TextStyle(
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
              ),
            ),
            icon: Icon(Icons.arrow_drop_down_sharp, color: Color(0xFFF2F9F1), size: 25,),
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