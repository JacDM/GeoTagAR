// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/main.dart';
import 'package:geotagar/methods/methods.dart';
import 'package:geotagar/screens/userLogIn_Register/forgot_password.dart';
import 'package:geotagar/screens/userLogIn_Register/register.dart';
import 'package:geotagar/screens/homepage.dart';

import '../../methods/text_Field.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  Future logIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailTextController.text.trim(),
            password: _passwordTextController.text.trim())
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: ((context) => HomePage()))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/LogIn_bg.png'),
                fit: BoxFit.cover)),
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
                    logo('assets/images/UpscaledLogoWhite.png'),
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
                    button(context, "Log In", () {
                      logIn();
                    }, Color.fromARGB(255, 164, 228, 255)),
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
