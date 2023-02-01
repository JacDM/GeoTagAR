//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/screens/discoverPages/discover.dart';
import 'package:geotagar/screens/memory_related/createMemoryRoute.dart';
import 'package:geotagar/screens/memory_related/create_memory.dart';
import 'package:geotagar/screens/unityAR.dart';
import 'package:geotagar/screens/unity_flutter_communication.dart';
import 'package:geotagar/screens/userAccountScreens/user_profile.dart';
import 'package:geotagar/screens/userAccountScreens/post_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geotagar/screens/userLogIn_Register/log_in.dart';
import 'package:geotagar/screens/globe.dart';
import 'package:geotagar/screens/map.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Temporary homepage, will be modified later
class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  final usersRef = FirebaseFirestore.instance.collection('users').snapshots();
  final storageRef = FirebaseStorage.instance.ref();

  int _currentIndex = 0;

  List<Widget> body = const [
    Icon(Icons.home),
    Icon(Icons.location_on),
    Icon(Icons.circle_outlined, size: 50),
    Icon(Icons.groups),
    Icon(Icons.person),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        // Temporary background image
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/LogIn_bg.png'),
                fit: BoxFit.cover)),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: IndexedStack(
              index: _currentIndex,
              children: [
                Post(),
                //GlobePage(),
                Map(),
                Unity(),
                DiscoverPage(),
                UserProfile(),
              ],
            ),
            // Center(
            //     //child: body[_currentIndex],
            //     child: ElevatedButton(
            //         child: Text("Sign out"),
            //         onPressed: () {
            //           FirebaseAuth.instance.signOut().then((value) {
            //             print("User has signed out");
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => const LogIn()));
            //           });
            //         })),
            bottomNavigationBar: SizedBox(
                height: 83,
                child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                      if (index == 3) print('user = $usersRef');
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                      backgroundColor: Colors.deepOrange,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.location_on),
                      label: 'Location',
                      backgroundColor: Colors.blueAccent,
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.circle_outlined, size: 50),
                        label: '',
                        backgroundColor: Color.fromARGB(255, 58, 197, 65)),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.groups),
                      label: 'Discover',
                      backgroundColor: Colors.purpleAccent,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                      //backgroundColor: Color.fromARGB(255, 114, 167, 0)
                    ),
                  ],
                ))));
  }
}
