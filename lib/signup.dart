import 'package:flutter/material.dart';
import 'loginpage.dart';


class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F9F1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'New Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5C715E),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LeagueSpartan',
                ),
              ),
              SizedBox(height: 20),
              ProfileTextField(label: 'Full name', hintText: 'example'),
              SizedBox(height: 20),
              ProfileTextField(label: 'Password', hintText: '***************', obscureText: true),
              SizedBox(height: 20),
              ProfileTextField(label: 'Email', hintText: 'example@example.com'),
              SizedBox(height: 20),
              ProfileTextField(label: 'Mobile Number', hintText: '+123 567 89000'),
              SizedBox(height: 20),
              ProfileTextField(label: 'Date Of Birth', hintText: 'DD / MM /YYY'),
              SizedBox(height: 20),
              Text(
                'By continuing, you agree to',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5C715E),
                  fontSize: 12,
                  fontFamily: 'LeagueSpartan',
                ),
              ),
              Text(
                'Terms of Use and Privacy Policy.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5C715E),
                  fontSize: 12,
                  fontFamily: 'LeagueSpartan',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5C715E),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFF2F9F1),
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'or sign up with',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5C715E),
                  fontSize: 14,
                  fontFamily: 'LeagueSpartan',
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset('assets/Icons/google.png'), // Replace with your asset
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset('assets/Icons/facebook.png'), // Replace with your asset
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset('assets/Icons/apple.png'), // Replace with your asset
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  'already have an account? Log in',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF5C715E),
                    fontSize: 14,
                    fontFamily: 'LeagueSpartan',
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

class ProfileTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool obscureText;

  ProfileTextField({
    required this.label,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  _ProfileTextFieldState createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 16,
            color: _isFocused? Color(0xFF5C715E) : Color(0xFF5C715E),
            fontFamily: 'LeagueSpartan',
          ),
        ),
        SizedBox(height: 8),
        TextField(
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Color(0xFFF2F9F1)),
            filled: true,
            fillColor: Color(0xFF5C715E),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
              ),
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            suffixIcon: widget.obscureText
              ? IconButton(
                    icon: Icon(Icons.visibility_off, color: Color(0xFFF2F9F1)),
                    onPressed: () {},
                  )
              : null,
          ),
          onTap: () {
            setState(() {
              _isFocused = true;
            });
          },
          onSubmitted: (value) {
            setState(() {
              _isFocused = false;
            });
          },
        ),
      ],
    );
  }
}

