import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../service/authentication_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../execption/auth_execption_handler.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? onPressed;

  const SignUpPage({super.key, this.onPressed});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _fullName = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();
  final _mobileNumber = TextEditingController();
  final _dob = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;

  void handleSignUp() {

  AuthenticationService()
    .SignUpWithEmailAndPassword(
      fullName: _fullName.text, 
      email: _email.text, 
      password: _password.text, 
      mobileNumber: _mobileNumber.text,
      dob: Timestamp.now()
    )
        .then(
      (status) 
        {
          // LoadingDialog.hideLoadingDialog(context);
          if (status == AuthResultStatus.successful) {
            Fluttertoast.showToast(msg: "Successfull");
          } else {
            final errorMsg =
              AuthExceptionHandler.generateExceptionMessage(status);
            Fluttertoast.showToast(msg: errorMsg);
          }
        }
    );
  }

  @override
  void dispose() {
    _fullName.dispose();
    _password.dispose();
    _email.dispose();
    _mobileNumber.dispose();
    _dob.dispose();
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
              primary: Color(0xFF5C715E), // dark green
              onPrimary: Color(0xFFF2F9F1), // white
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dob.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F9F1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'New Account',
          style: TextStyle(
            color: Color(0xFF5C715E),
            fontFamily: 'LeagueSpartan',
          ),
        ),
        backgroundColor: Color(0xFFF2F9F1),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF5C715E),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _fullName,
                  style: TextStyle(color: Color(0xFFF2F9F1)),
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: TextStyle(color: Color(0xFFF2F9F1)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF5C715E),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _password,
                  obscureText: true,
                  style: TextStyle(color: Color(0xFFF2F9F1)),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Color(0xFFF2F9F1)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                    suffixIcon: IconButton(
                          icon: Icon(
                            _showPassword ? Icons.visibility : Icons.visibility_off,
                            color: Color(0xFFF2F9F1),
                          ),
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF5C715E),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _email,
                  style: TextStyle(color: Color(0xFFF2F9F1)),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Color(0xFFF2F9F1)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF5C715E),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _mobileNumber,
                  style: TextStyle(color: Color(0xFFF2F9F1)),
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    labelStyle: TextStyle(color: Color(0xFFF2F9F1)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF5C715E),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _dob,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  style: TextStyle(color: Color(0xFFF2F9F1)),
                  decoration: InputDecoration(
                    labelText: 'Date Of Birth',
                    labelStyle: TextStyle(color: Color(0xFFF2F9F1)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your date of birth';
                    }
                    return null;
                  },
                ),
              ),
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    handleSignUp();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5C715E),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
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
                onPressed: widget.onPressed,
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