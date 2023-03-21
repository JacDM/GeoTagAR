// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:geotagar/utils/methods.dart';
import 'package:geotagar/screens/userLogIn_Register/log_in.dart';
import 'package:intl/intl.dart';

import 'package:geotagar/services/auth.dart';
import 'package:geotagar/utils/rectangle_rounded_button.dart';

import '../../core/constants/constants.dart';
import '../../utils/text_Field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Variables
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();

  // Prefer not to say?
  final _gender = ["Male", "Female", "Other"];
  final _accountType = ["General", "Geocacher", "Historian"];
  String _selectedGender = "";
  String _selectedAccountType = "";
  String email = "";
  String username = "";
  String name = "";
  //String lastName = "";
  int age = 0;
  int day = 0;
  int month = 0;
  int year = 0;
  DateTime birthday = DateTime(0, 0, 0);

  @override
  void dispose() {
    _emailTextController.dispose();
    _usernameTextController.dispose();
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future register() async {
    if (passwordMatch()) {
      int age = calculateAge(_birthdateController.text.trim());
      if (age >= 18) {
        await AuthServices()
            .signUp(
              email: email,
              username: username,
              password: _passwordTextController.text.trim(),
              name: name,
              gender: _selectedGender,
              accountType: _selectedAccountType,
              age: age,
            )
            .then((value) => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LogIn()))
                .onError((error, stackTrace) => print("#${error.toString()}")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Usage is restricted to users below 18!")));
      }
    }
  }

  void convert() {
    setState(() {
      username = _usernameTextController.text.trim();
      email = _emailTextController.text.trim();
      name = _nameController.text.trim();
    });
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
                image: AssetImage(Constants.registerBGPath),
                fit: BoxFit.cover)),
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.black, //change your color here
              ),
              backgroundColor: Color.fromARGB(0, 103, 143, 51),
              foregroundColor: Color.fromARGB(255, 68, 68, 68),
              elevation: 0,
            ),
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Container(
                child: SingleChildScrollView(
                    child: Form(
                        key: formKey,
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                20,
                                MediaQuery.of(context).size.height * 0.2,
                                20,
                                0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Modify this later
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.0001),
                                  logo(Constants.logoPathWhite),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04),
                                  SizedBox(height: 20),
                                  ReusableTextField(
                                    hintText: "Name",
                                    obscure: false,
                                    controller: _nameController,
                                  ),
                                  SizedBox(height: 20),
                                  ReusableTextField(
                                      hintText: "Username",
                                      obscure: false,
                                      controller: _usernameTextController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Username cannot be empty";
                                        }
                                        return null;
                                      }),
                                  SizedBox(height: 20),
                                  ReusableTextField(
                                      hintText: "Email",
                                      obscure: false,
                                      controller: _emailTextController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Email cannot be empty";
                                        }
                                        return null;
                                      }),
                                  SizedBox(height: 20),
                                  ReusableTextField(
                                      hintText: "Password",
                                      obscure: true,
                                      controller: _passwordTextController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Password cannot be empty!";
                                        }
                                        return null;
                                      }),
                                  SizedBox(height: 20),
                                  // Add password validation and extra rows i.e., date of birth etc
                                  ReusableTextField(
                                      hintText: "Confirm Password",
                                      obscure: true,
                                      controller:
                                          _confirmPasswordTextController),
                                  SizedBox(height: 20),
                                  InkWell(
                                    onTap: () async {
                                      final DateTime? picked =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now(),
                                      );
                                      if (picked != null) {
                                        _birthdateController.text =
                                            DateFormat('yyyy-MM-dd')
                                                .format(picked);
                                      }
                                    },
                                    child: IgnorePointer(
                                      child: ReusableTextField(
                                        hintText: "Birthdate",
                                        obscure: false,
                                        controller: _birthdateController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Birthdate cannot be empty";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 20),
                                  DropdownButtonFormField(
                                    items: _gender
                                        .map((e) => DropdownMenuItem(
                                              child: Text(e),
                                              value: e,
                                            ))
                                        .toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        _selectedGender = val.toString();
                                      });
                                    },
                                    icon: const Icon(Icons.arrow_drop_down),
                                    //dropdownColor:
                                    // Gender or sex idk
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                                255, 58, 58, 58)
                                            .withOpacity(0.9),
                                        fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "Select Gender",
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                              255, 122, 122, 122)
                                          .withOpacity(0.3),
                                      hintStyle: TextStyle(
                                          color: const Color.fromARGB(
                                                  255, 126, 126, 126)
                                              .withOpacity(0.9),
                                          fontWeight: FontWeight.bold),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 20),
                                      border: (OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        borderSide: const BorderSide(
                                            width: 0, style: BorderStyle.none),
                                      )),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  DropdownButtonFormField(
                                    items: _accountType
                                        .map((e) => DropdownMenuItem(
                                              child: Text(e),
                                              value: e,
                                            ))
                                        .toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        _selectedAccountType = val.toString();
                                      });
                                    },
                                    icon: const Icon(Icons.arrow_drop_down),
                                    //dropdownColor:
                                    // Gender or sex idk
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                                255, 58, 58, 58)
                                            .withOpacity(0.9),
                                        fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "Account Type",
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                              255, 122, 122, 122)
                                          .withOpacity(0.3),
                                      hintStyle: TextStyle(
                                          color: const Color.fromARGB(
                                                  255, 126, 126, 126)
                                              .withOpacity(0.9),
                                          fontWeight: FontWeight.bold),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 20),
                                      border: (OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        borderSide: const BorderSide(
                                            width: 0, style: BorderStyle.none),
                                      )),
                                    ),
                                  ),

                                  SizedBox(height: 20),
                                  RectangleButton(
                                      title: "Sign Up",
                                      onTap: () {
                                        // Requires validation
                                        // final name =
                                        //   _usernameTextController.text.trim();
                                        setState(() {
                                          if (formKey.currentState!
                                              .validate()) {
                                            print("Validated");
                                            convert();
                                            emailValidator();
                                            print("Select gender is: " +
                                                _selectedGender);
                                            print("Select account type is: " +
                                                _selectedAccountType);

                                            //modelData();
                                            //DatabaseMethods().addUser(user);

                                            register();
                                          } else {
                                            print("Not Validated");
                                          }
                                        });
                                      },
                                      buttonColor:
                                          Color.fromARGB(255, 214, 238, 120)),
                                  SizedBox(height: 30),
                                  signInLink(),
                                  SizedBox(height: 100),
                                ])))))));
  }

  int calculateAge(String birthdate) {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    DateTime birthDate = dateFormat.parse(birthdate);
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;

    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  Row signInLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
