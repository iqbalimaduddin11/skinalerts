import 'package:skinalert/authentication/auth_service.dart';
import 'package:flutter/material.dart';
import 'loginpage.dart';

<<<<<<< HEAD
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  bool _showPassword = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _mobileNumberController.dispose();
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
        _dobController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }
=======
class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _number = TextEditingController();
  // final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

>>>>>>> d505008 (update feature login)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
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
=======
      backgroundColor: const Color(0xFFF2F9F1),
>>>>>>> d505008 (update feature login)
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
<<<<<<< HEAD
              SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(
=======
              const Text(
                'New Account',
                textAlign: TextAlign.center,
                style: TextStyle(
>>>>>>> d505008 (update feature login)
                  color: Color(0xFF5C715E),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _fullNameController,
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
<<<<<<< HEAD
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF5C715E),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _passwordController,
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
                  controller: _emailController,
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
                  controller: _mobileNumberController,
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
                  controller: _dobController,
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
=======
              const SizedBox(height: 20),
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(labelText: 'example'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(labelText: 'example@example.com'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(labelText: '**********'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _number,
                decoration: const InputDecoration(labelText: '+1234 567 890'),
              ),
              // const SizedBox(height: 20),
              // TextFormField(),
              const SizedBox(height: 20),
              const Text(
>>>>>>> d505008 (update feature login)
                'By continuing, you agree to',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5C715E),
                  fontSize: 12,
                  fontFamily: 'LeagueSpartan',
                ),
              ),
              const Text(
                'Terms of Use and Privacy Policy.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5C715E),
                  fontSize: 12,
                  fontFamily: 'LeagueSpartan',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
<<<<<<< HEAD
                  backgroundColor: Color(0xFF5C715E),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
=======
                  backgroundColor: const Color(0xFF5C715E),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
>>>>>>> d505008 (update feature login)
                  ),
                ),
                onPressed: () async {
                  await AuthService().signup(
                    email: _email.text, 
                    password: _password.text
                  );
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => const LoginPage())
                    );
                  }
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFF2F9F1),
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'or sign up with',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5C715E),
                  fontSize: 14,
                  fontFamily: 'LeagueSpartan',
                ),
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text(
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
<<<<<<< HEAD
=======

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
            color: _isFocused? const Color(0xFF5C715E) : const Color(0xFF5C715E),
            fontFamily: 'LeagueSpartan',
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Color(0xFFF2F9F1)),
            filled: true,
            fillColor: const Color(0xFF5C715E),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
          ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            suffixIcon: widget.obscureText
              ? IconButton(
                    icon: const Icon(Icons.visibility_off, color: Color(0xFFF2F9F1)),
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

>>>>>>> d505008 (update feature login)
