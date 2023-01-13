// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:email_validator/email_validator.dart';
import 'package:geotagar/methods/methods.dart';
import 'package:geotagar/screens/userLogIn_Register/log_in.dart';

import '../../methods/text_Field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();
  // Ask whether full name (like instagram)
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  // MODIFY WITH DATE OF BIRTH
  final TextEditingController _ageController = TextEditingController();
  String emailError = '';

  @override
  void dispose() {
    _emailTextController.dispose();
    _usernameTextController.dispose();
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future register() async {
    if (passwordMatch()) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailTextController.text.trim(),
              password: _passwordTextController.text.trim())
          .then((value) => Navigator.push(
              context,
              MaterialPageRoute(
                  // Should take to forgot password screen, yet to be implemented since its linked w/ firebase
                  builder: (context) => LogIn())).onError(
              (error, stackTrace) => print("#${error.toString()}")));
    }
  }

  bool passwordMatch() {
    if (_passwordTextController.text.trim() ==
        _confirmPasswordTextController.text.trim()) {
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords do not match.")));
      return false;
    }
  }

  void emailValidator() {
    if (EmailValidator.validate(_emailTextController.text.trim())) {
      print("Valid email");
    } else if (_emailTextController.text.trim().isEmpty) {
      setState(() {
        emailError = "Email can not be empty";
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Email address cannot be empty.")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter a valid email address.")));
      print("Invalid email");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/registerBG.png'),
                fit: BoxFit.cover)),
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Color.fromARGB(0, 103, 143, 51),
              foregroundColor: Color.fromARGB(255, 68, 68, 68),
              elevation: 0,
            ),
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Container(
                //width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(20,
                            MediaQuery.of(context).size.height * 0.2, 20, 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Modify this later
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.0001),
                              logo('assets/images/UpscaledLogoWhite.png'),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.08),
                              // ReusableTextField(
                              //   hintText: "Age Test",
                              //   obscure: false,
                              //   controller: _ageController,
                              // ),
                              SizedBox(height: 20),
                              ReusableTextField(
                                  hintText: "First Name",
                                  obscure: false,
                                  controller: _firstNameController),
                              SizedBox(height: 20),
                              ReusableTextField(
                                  hintText: "Last Name",
                                  obscure: false,
                                  controller: _lastNameController),
                              SizedBox(height: 20),
                              ReusableTextField(
                                  hintText: "Username",
                                  obscure: false,
                                  controller: _usernameTextController),
                              SizedBox(height: 20),
                              ReusableTextField(
                                hintText: "Email",
                                obscure: false,
                                controller: _emailTextController,
                              ),
                              //ReusableTextField1(
                              //    "E-mail", false, _emailTextController),
                              SizedBox(height: 20),
                              ReusableTextField(
                                  hintText: "Password",
                                  obscure: true,
                                  controller: _passwordTextController),
                              SizedBox(height: 20),
                              // Add password validation and extra rows i.e., date of birth etc
                              ReusableTextField(
                                  hintText: "Confirm Password",
                                  obscure: true,
                                  controller: _confirmPasswordTextController),
                              SizedBox(height: 20),
                              button(context, "Sign Up", () {
                                // Requires validation
                                emailValidator();
                                register();
                                //Navigator.push(
                                //context,
                                //MaterialPageRoute(
                                // Should take to forgot password screen, yet to be implemented since its linked w/ firebase
                                //builder: (context) => LogIn()));
                              }, Color.fromARGB(255, 214, 238, 120)),
                              SizedBox(height: 20),
                              // Red validator
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Text(
                              //     _errorMessage,
                              //     style: TextStyle(color: Colors.red),
                              //   ),
                              // ),
                              // Maybe remove this
                              SizedBox(height: 20),
                              signInLink(),
                            ]))))));
  }

  Row signInLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const Text("Don't have account?",
        //     style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LogIn()));
          },
          child: RichText(
            text: TextSpan(
              text: "Have an account? ",
              style: TextStyle(color: Colors.black, fontSize: 13),
              children: <TextSpan>[
                TextSpan(
                    text: "Log In",
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
