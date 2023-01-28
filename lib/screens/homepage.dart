import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/providers/user_provider.dart';
import 'package:geotagar/screens/discoverPages/discover.dart';
import 'package:geotagar/screens/feed.dart';
import 'package:geotagar/screens/memory_related/createMemoryRoute.dart';
import 'package:geotagar/screens/memory_related/create_memory.dart';
import 'package:geotagar/screens/unity_flutter_communication.dart';
import 'package:geotagar/screens/userAccountScreens/user_profile.dart';
import 'package:geotagar/screens/userAccountScreens/post_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geotagar/screens/userLogIn_Register/log_in.dart';
import 'package:geotagar/screens/globe.dart';
import 'package:provider/provider.dart';
import 'package:geotagar/models/users.dart' as model;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Temporary homepage, will be modified later
class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  String username = "";

  @override
  void initState() {
    super.initState();
    addData();
    //getUserName();
  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
    // await Firebase.initializeApp();
    // CollectionReference users = FirebaseFirestore.instance.collection('users');
    // users.add({'name': 'John Doe', 'age': 42});
  }

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
    model.User user = Provider.of<UserProvider>(context).getUser;
    getUserName();
    //var email = user!.email;
    //var userName = user!.displayName;
    //print(email);
    //print(userName);
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
                feedScreen(),
                Post(),
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
                      backgroundColor: Colors.white,
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

  void getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    print(snap.data());
  }
}
