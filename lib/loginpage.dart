import 'package:fluttertoast/fluttertoast.dart';
<<<<<<< HEAD
// import 'package:skinalert/authentication/authentication_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:skinalert/home/main_page.dart';
import 'signup.dart'; 
<<<<<<< HEAD
=======
=======
import 'package:skinalert/execption/auth_execption_handler.dart';
import 'package:skinalert/service/authentication_service.dart';
import 'signup.dart';
import 'home.dart';
<<<<<<< HEAD
>>>>>>> 617d2db (update loginpage)
=======
=======
import 'package:flutter/material.dart';
import 'package:skinalert/execption/auth_execption_handler.dart';
import 'package:skinalert/service/authentication_service.dart';
// import 'signup.dart';
// import 'home.dart';
>>>>>>> f08f975 (update login & signup page)
>>>>>>> 834b9f3 (update login & signup page)


class LoginPage extends StatefulWidget {
  final void Function()? onPressed;
  
  const LoginPage({super.key, this.onPressed});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;

  void handleLogin() {
    AuthenticationService()
      .loginWithEmailAndPassword(
        email: _email.text,
        password: _password.text
      )
      .then(
        (status) {
          if (status == AuthResultStatus.successful) {
            Fluttertoast.showToast(msg: "Successfull");
          } else {
            final errorMsg = 
              AuthExceptionHandler.generateExceptionMessage(status);
            Fluttertoast.showToast(msg: errorMsg);
          }
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F9F1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const SizedBox(),
          centerTitle: true,
          title: const Text(
            'Log In',
            style: TextStyle(
              color: Color(0xFF5C715E),
              fontFamily: 'LeagueSpartan',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 16),
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      color: Color(0xFF5C715E),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LeagueSpartan',
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'SkinAlert Apps, Solusi pintar untuk deteksi dini kanker kulit.',
                    style: TextStyle(
                      color: Color(0xFF5C715E),
                      fontFamily: 'LeagueSpartan',
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Email or Mobile Number',
                    style: TextStyle(
                      color: Color(0xFF5C715E),
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'LeagueSpartan',
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF5C715E),
<<<<<<< HEAD
<<<<<<< HEAD
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextFormField(
                      controller: _email,
=======
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: TextFormField(
                      controller: _emailController,
>>>>>>> aeb3465 (push branch production)
=======
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextFormField(
                      controller: _email,
>>>>>>> f08f975 (update login & signup page)
                      style: const TextStyle(color: Color(0xFFF2F9F1)),
                      decoration: const InputDecoration(
                        labelText: 'example@example.com',
                        labelStyle: TextStyle(color: Color(0xFFF2F9F1)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                      ),
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter your email or mobile number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Password',
                    style: TextStyle(
                      color: Color(0xFF5C715E),
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'LeagueSpartan',
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF5C715E),
<<<<<<< HEAD
<<<<<<< HEAD
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextFormField(
                      controller: _password,
=======
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: TextFormField(
                      controller: _passwordController,
>>>>>>> aeb3465 (push branch production)
=======
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextFormField(
                      controller: _password,
>>>>>>> f08f975 (update login & signup page)
                      style: const TextStyle(color: Color(0xFFF2F9F1)),
                      obscureText: !_showPassword,
                      decoration: InputDecoration(
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                        labelText: 'Enter your password',
                        labelStyle: const TextStyle(color: Color(0xFFF1F8E8)),
=======
<<<<<<< HEAD
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Color(0xFFF2F9F1)),
=======
                        labelText: 'Enter your password',
                        labelStyle: const TextStyle(color: Color(0xFFF1F8E8)),
>>>>>>> 9c3a5ef (first commit)
>>>>>>> 5b710bf (push branch production)
=======
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Color(0xFFF2F9F1)),
>>>>>>> 6749efe (push branch production)
=======
                        labelText: 'Enter your password',
                        labelStyle: const TextStyle(color: Color(0xFFF1F8E8)),
>>>>>>> 834b9f3 (update login & signup page)
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _showPassword ? Icons.visibility : Icons.visibility_off,
                            color: const Color(0xFFF1F8E8),
                          ),
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forget Password',
                        style: TextStyle(
                          fontFamily: 'LeagueSpartan',
                          fontSize: 16,
                          color: Color(0xFF5C715E),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
=======
                  SizedBox(height: 32),
>>>>>>> 708b273 (update now)
=======
=======
>>>>>>> 5b710bf (push branch production)
=======
>>>>>>> 834b9f3 (update login & signup page)
                  SizedBox(height: 32),
=======
                  // const SizedBox(height: 16),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: TextButton(
                  //     onPressed: () {},
                  //     child: const Text(
                  //       'Forget Password',
                  //       style: TextStyle(
                  //         fontFamily: 'LeagueSpartan',
                  //         fontSize: 16,
                  //         color: Color(0xFF5C715E),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 32),
>>>>>>> d505008 (update feature login)
<<<<<<< HEAD
>>>>>>> e3bc1d7 (update feature login)
=======
=======
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forget Password',
                        style: TextStyle(
                          fontFamily: 'LeagueSpartan',
                          fontSize: 16,
                          color: Color(0xFF5C715E),
                        ),
                      ),
                    ),
                  ),
=======
>>>>>>> f08f975 (update login & signup page)
                  const SizedBox(height: 32),
>>>>>>> aeb3465 (push branch production)
>>>>>>> 5b710bf (push branch production)
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigate to HomePage after login validation
<<<<<<< HEAD
<<<<<<< HEAD
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                        );
=======
                        handleLogin();
>>>>>>> d505008 (update feature login)
=======
                        handleLogin();
>>>>>>> f08f975 (update login & signup page)
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5C715E),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Color(0xFFF1F8E8),
                        fontFamily: 'LeagueSpartan',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Center(
                    child: Text(
                      'or sign up with',
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/Icons/google.png'),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/Icons/facebook.png'),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/Icons/apple.png'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: TextButton(
                      onPressed: widget.onPressed,
                      child: const Text(
                        "Don't have an account? Sign Up",
                        style: TextStyle(
                          fontFamily: 'LeagueSpartan',
                          fontSize: 16,
                          color: Color(0xFF5C715E),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
