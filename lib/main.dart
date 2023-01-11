import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geotagar/firebase_options.dart';
import 'package:geotagar/screens/log_in.dart';

import 'package:geotagar/screens/homepage.dart';
import 'package:geotagar/screens/unityAR.dart';
import 'package:geotagar/screens/default.dart';
import 'package:geotagar/screens/userAccountScreens/privacy_and_security.dart';
import 'package:geotagar/screens/userAccountScreens/user_profile.dart';
import 'package:geotagar/screens/userAccountScreens/user_settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: UnityAR(),
      home: LogIn(),
    );
  }
}
