import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/utils/colors.dart';
import 'package:geotagar/utils/global_variables.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: homeScreenItems,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        iconSize: 30,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        backgroundColor: Pallete.darkModeAppTheme.scaffoldBackgroundColor,
        selectedItemColor: Color.fromARGB(255, 122, 227, 65),
        unselectedItemColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
            backgroundColor: Pallete.blackColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: '',
            backgroundColor: Pallete.blackColor,
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _page == 2
                      ? Color.fromARGB(255, 122, 227, 65)
                      : Colors.white,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _page == 2
                          ? Color.fromARGB(255, 122, 227, 65)
                          : Colors.white,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            label: '',
            backgroundColor: Color.fromARGB(255, 29, 29, 29),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: '',
            backgroundColor: Color.fromARGB(255, 29, 29, 29),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
            backgroundColor: Color.fromARGB(255, 29, 29, 29),
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}
