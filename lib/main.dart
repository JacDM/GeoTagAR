import 'package:flutter/material.dart';
import 'package:geotagar/screens/globe.dart';
import 'package:geotagar/screens/homepage.dart';
import 'package:geotagar/screens/log_in.dart';
import 'package:geotagar/screens/unityAR.dart';
import 'package:geotagar/screens/default.dart';
import 'package:geotagar/screens/userAccountScreens/privacy_and_security.dart';
import 'package:geotagar/screens/userAccountScreens/user_profile.dart';
import 'package:geotagar/screens/userAccountScreens/user_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //removed 'const' keyword from return const MaterialApp
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //Theme set for User Account Screens
      theme: ThemeData(
        accentColor: Colors.black,
        scaffoldBackgroundColor: Colors.blueGrey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[800],
          shadowColor: Colors.teal[900],
          toolbarHeight: 50.0,
        ),
      ),


      home: const UserProfile(),
      //home: UnityAR(),
<<<<<<< HEAD
      home: GlobePage(),
=======
>>>>>>> b341965550e62f3039b91192b7d874b941637015
    );
  }
}