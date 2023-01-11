import 'package:flutter/material.dart';
import 'package:geotagar/screens/feed.dart';
import 'package:geotagar/screens/userAccountScreens/user_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Temporary homepage, will be modified later
class _HomePageState extends State<HomePage> {
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
            //body: Center(
            //  child: body[_currentIndex],
            //),
            body: IndexedStack(
              index: _currentIndex,
              children: [
                HomeFeed(),
                Container(),
                Container(),
                Container(),
                UserProfile(),
              ],
            ),
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
                      backgroundColor: Colors.blueAccent,
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.circle_outlined, size: 50),
                        label: '',
                        backgroundColor: Colors.greenAccent),
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
