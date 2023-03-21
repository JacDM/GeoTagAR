// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/services/auth.dart';
import 'package:path_provider/path_provider.dart';
import '../../../core/constants/constants.dart';
import '../../../utils/methods.dart';
import '../UserSettings/edit_profile.dart';
import '../UserSettings/account_settings.dart';
import '../UserSettings/privacy_and_security.dart';
import '../UserSettings/report.dart';
import '../reusableWidgets/page_tabs.dart';

const Color k_SwitchIconColour = Color(0xFF263238); //bluegrey[900]
const Color k_UsernameColour = Colors.black;
const Color k_versionColor = Colors.blueGrey;
const Color k_dividerColor = Colors.grey;
const Color k_darkModeFontTextColor = Color(0xFF004D40); //teal[900]
const Color k_logoutFontTextColor = Color(0xFFC62828); //red[800]

const spacing = SizedBox(height: 25.0);
int counter = 0;

enum ViewMode { light, dark }

ViewMode viewMode = ViewMode.light;

class SettingsPage extends StatefulWidget {
  final String uid;
  const SettingsPage({super.key, required this.uid});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var userData = {};
  bool isFollowing = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> _deleteCacheDir() async {
    Directory tempDir = await getTemporaryDirectory();

    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  }

  Icon darkModeSwitch = const Icon(
    Icons.toggle_on_outlined,
    size: 75.0,
    color: k_SwitchIconColour,
  );
  Icon lightModeSwitch = const Icon(
    Icons.toggle_off_outlined,
    size: 75.0,
    color: k_SwitchIconColour,
  );

  void darkMode() {
    setState(() {
      counter++;
      viewMode = counter % 2 == 0 ? ViewMode.light : ViewMode.dark;
    });
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();

      userData = userSnap.data()!;
      setState(() {});
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 29, 29, 29),
        toolbarHeight: 90,
        title: const Text('Settings'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 75.0,
                        backgroundColor: Colors.white38,
                        child: CircleAvatar(
                          radius: 70.0,
                          backgroundImage:
                              NetworkImage(Constants.avatarDefault),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          userData['username'],
                          style: const TextStyle(
                            fontSize: 25.0,
                            color: k_UsernameColour,
                          ),
                        ),
                      ),
                      const Text(
                        'Version 1.0',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: k_versionColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                        child: Divider(
                          color: k_dividerColor,
                          thickness: 2.0,
                        ),
                      ),
                      spacing,
                      PageTab(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const AccountSettings();
                          }));
                        },
                        pageTabLabel: 'Account Settings',
                      ),
                      spacing,
                      PageTab(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const PrivacyAndSecurity();
                          }));
                        },
                        pageTabLabel: 'Privacy and Security',
                      ),
                      spacing,
                      PageTab(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Report();
                          }));
                        },
                        pageTabLabel: 'Report a Problem',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              'Dark Mode',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26.0,
                                color: k_darkModeFontTextColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: darkMode,
                              child: viewMode == ViewMode.dark
                                  ? darkModeSwitch
                                  : lightModeSwitch,
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          AuthServices().signOut(context).then((value) {
                            print("User has signed out");
                            Navigator.pushNamed(context, '/');
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: k_logoutFontTextColor,
                          foregroundColor: Colors.white,
                        ),
                        child: Text("Sign out"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
