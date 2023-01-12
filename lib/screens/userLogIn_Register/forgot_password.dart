import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/methods/methods.dart';
import 'package:geotagar/screens/homepage.dart';
import 'package:geotagar/screens/userLogIn_Register/log_in.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/forgotPasswordBG.png'),
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
                child: SingleChildScrollView(
                    //         // maybe modify with media query (padding)
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(20,
                            MediaQuery.of(context).size.height * 0.2, 20, 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              logo('assets/images/UpscaledLogoWhite.png'),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.125),
                              const Text("Forgot Password?",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 71, 71, 71),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 10),
                              const Text(
                                  "Enter the email address associated with your account to receive a link to reset your password.",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 102, 102, 102),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 13),
                              reusableTextField("example@email.com", false,
                                  _emailTextController),
                              const SizedBox(height: 15),
                              forgotPasswordButton(),
                              // button(context, "Reset password", () {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: ((context) => const LogIn())));
                              // }, const Color.fromARGB(255, 164, 228, 255)),
                            ]))))));
  }

  Row forgotPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Add extra page and form validation too
        button(context, "Reset password", () {
          FirebaseAuth.instance
              .sendPasswordResetEmail(email: _emailTextController.text.trim());
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const LogIn())));
        }, const Color.fromARGB(255, 164, 228, 255)),
      ],
    );
  }
}
