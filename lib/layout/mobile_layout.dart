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
  late PageController pageController; // for tabs animation

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
    //Animating Page
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
        iconSize: 30,
        backgroundColor: Pallete.darkModeAppTheme.scaffoldBackgroundColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: (_page == 0) ? Pallete.whiteColor : Pallete.whiteColor,
            ),
            label: '',
            backgroundColor: Pallete.blackColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_pin,
              color: (_page == 1) ? Pallete.whiteColor : Pallete.whiteColor,
            ),
            label: '',
            backgroundColor: Pallete.blackColor,
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.circle_outlined,
                color: (_page == 2) ? Pallete.whiteColor : Pallete.whiteColor,
                size: 55,
              ),
              label: '',
              backgroundColor: Pallete.blackColor),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group,
              color: (_page == 3) ? Pallete.whiteColor : Pallete.whiteColor,
            ),
            label: '',
            backgroundColor: Pallete.blackColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: (_page == 4) ? Pallete.whiteColor : Pallete.whiteColor,
            ),
            label: '',
            backgroundColor: Pallete.blackColor,
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}
