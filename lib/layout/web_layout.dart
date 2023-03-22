import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geotagar/utils/colors.dart';
import 'package:geotagar/utils/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geotagar/utils/methods.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  int _page = 0;
  late PageController pageController; // for tabs animation

  late Map<String, dynamic> userData;
  bool isLoading = false;

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
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
  void initState() {
    getData();
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
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          CircularProgressIndicator(
            value: 0.3,
            color: Colors.greenAccent,
          ),
        ],
      );
    } else {
    
    
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/forgotPasswordBG.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: (userData['isAdmin'])=='true' //userData['isAdmin']=='true')
          ? Scaffold(
              //admin
              appBar: AppBar(
                backgroundColor: Color.fromARGB(31, 0, 0, 0),
                automaticallyImplyLeading: false,
                centerTitle: false,
                title: const Text("Reported Posts"),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.report_outlined,
                      color: _page == 0 ? Colors.green : Pallete.whiteColor,
                    ),
                    onPressed: () => navigationTapped(0),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.group_remove_outlined,
                      color: _page == 1 ? Colors.green : Pallete.whiteColor,
                    ),
                    onPressed: () => navigationTapped(1),
                  ),
                  // IconButton(
                  //   icon: Icon(
                  //     Icons.add_a_photo,
                  //     color: _page == 2 ? Colors.green : Pallete.whiteColor,
                  //   ),
                  //   onPressed: () => navigationTapped(2),
                  // ),
                  IconButton(
                    icon: Icon(
                      Icons.groups,
                      color: _page == 2 ? Colors.green : Pallete.whiteColor,
                    ),
                    onPressed: () => navigationTapped(2),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.admin_panel_settings,
                      color: _page == 3 ? Colors.green : Pallete.whiteColor,
                    ),
                    onPressed: () => navigationTapped(3),
                  ),
                ],
              ),
              body: PageView(
                physics: const NeverScrollableScrollPhysics(),
                children: webScreenItems,
                controller: pageController,
                onPageChanged: onPageChanged,
              ),
            )
          : Scaffold( 
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor:
                    Pallete.darkModeAppTheme.scaffoldBackgroundColor,
                centerTitle: false,
                title: SvgPicture.asset(
                  'assets/images/forgotPasswordBG.png',
                  color: Pallete.greyColor,
                  height: 32,
                ),
                actions: [
                  IconButton(
                      onPressed: () => navigationTapped(0),
                      icon: Icon(
                        Icons.home,
                        color: _page == 0 ? Colors.green : Pallete.whiteColor,
                      )),
                  IconButton(
                      onPressed: () => navigationTapped(1),
                      icon: Icon(
                        Icons.search,
                        color: _page == 1 ? Colors.green : Pallete.whiteColor,
                      )),
                  IconButton(
                      onPressed: () => navigationTapped(2),
                      icon: Icon(
                        Icons.add_a_photo,
                        color: _page == 2 ? Colors.green : Pallete.whiteColor,
                      )),
                  IconButton(
                      onPressed: () => navigationTapped(3),
                      icon: Icon(
                        Icons.favorite,
                        color: _page == 3 ? Colors.green : Pallete.whiteColor,
                      )),
                  IconButton(
                      onPressed: () => navigationTapped(4),
                      icon: Icon(
                        Icons.person,
                        color: _page == 4 ? Colors.green : Pallete.whiteColor,
                      )),
                ],
              ),
              body: PageView(
                physics: const NeverScrollableScrollPhysics(),
                children: homeScreenItems,
                controller: pageController,
                onPageChanged: onPageChanged,
              ),
            ), //normal user
    );
  }
}
}