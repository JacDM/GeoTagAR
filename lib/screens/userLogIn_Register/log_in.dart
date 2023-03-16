// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/layout/layout_select.dart';
import 'package:geotagar/layout/mobile_layout.dart';
import 'package:geotagar/layout/web_layout.dart';
import 'package:geotagar/main.dart';
import 'package:geotagar/services/auth.dart';
import 'package:geotagar/utils/methods.dart';
import 'package:geotagar/screens/userLogIn_Register/forgot_password.dart';
import 'package:geotagar/screens/userLogIn_Register/register.dart';
import 'package:geotagar/screens/homepage.dart';
import 'package:geotagar/utils/rectangle_rounded_button.dart';

import '../../core/constants/constants.dart';
import '../../utils/text_Field.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  String _emailError = "";

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  // Future logIn() async {
  //   await FirebaseAuth.instance
  //       .signInWithEmailAndPassword(
  //           email: _emailTextController.text.trim(),
  //           password: _passwordTextController.text.trim())
  //       .then((value) => Navigator.push(
  //           context, MaterialPageRoute(builder: ((context) => HomePage()))));
  // }

  void logIn() async {
    await AuthServices()
        .logIn(
            email: _emailTextController.text.trim(),
            password: _passwordTextController.text.trim())
        .then((value) => Navigator.pushReplacementNamed(context, '/home'));
    // .then(((value) => Navigator.pushNamed(
    //     context,
    //     MaterialPageRoute(
    //         builder: ((context) => LayoutSelect(
    //               mobileLayout: MobileScreenLayout(),
    //               webLayout: WebScreenLayout(),
    //             ))))));
  }

  bool emailValidator() {
    if (EmailValidator.validate(_emailTextController.text.trim())) {
      print("Valid email");
      return true;
    } else if (_emailTextController.text.trim().isEmpty) {
      setState(() {
        _emailError = "Email can not be empty";
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Email address cannot be empty.")));
      return false;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter a valid email address.")));
      print("Invalid email");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Constants.logInBGPath), fit: BoxFit.cover)),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Container(
                child: SingleChildScrollView(
              //         // maybe modify with media query (padding)
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    20, MediaQuery.of(context).size.height * 0.2, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    logo(Constants.logoPathWhite),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.125),
                    //modify font weight
                    ReusableTextField(
                        hintText: "Email",
                        obscure: false,
                        controller: _emailTextController),
                    SizedBox(height: 20),
                    ReusableTextField(
                        hintText: "Password",
                        obscure: true,
                        controller: _passwordTextController),
                    SizedBox(height: 15),
                    // Modify this button further
                    RectangleButton(
                        title: "Log In",
                        onTap: () {
                          if (emailValidator()) {
                            logIn();
                          }
                        },
                        buttonColor: Color.fromARGB(255, 164, 228, 255)),
                    SizedBox(height: 2),
                    // Further modify this to be a function (maybe)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                // Should take to forgot password screen, yet to be implemented since its linked w/ firebase
                                builder: (context) => ForgotPassword()));
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 13,
                        ),
                      ),
                    ),

                    SizedBox(height: 100),
                    signUpLink(),
                  ],
                ),
              ),
            ))));
  }

  Row signUpLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterPage()));
          },
          child: RichText(
            text: TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(color: Colors.black, fontSize: 13),
              children: <TextSpan>[
                TextSpan(
                    text: "Sign Up",
                    style: TextStyle(
                        color: Color.fromARGB(255, 46, 127, 248),
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
