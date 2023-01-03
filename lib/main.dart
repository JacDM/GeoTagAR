import 'package:flutter/material.dart';
import 'edit_profile.dart';
import 'package:geotaggar_user_profile_page/report.dart';
import 'account_settings.dart';
import 'privacy_and_security.dart';
import 'user_profile.dart';
import 'user_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(),
      theme: ThemeData(
        //primaryColor: Colors.blueGrey[300],
        accentColor: Colors.grey[900],
      ),
      //home: const UserProfile(),
      //home: const SettingsPage(),
      //home: const PrivacyAndSecurity(),
      //home: const AccountSettings(),
      //home: const EditProfile(),
      home: const Report(),
    );
  }
}

