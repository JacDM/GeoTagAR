import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geotagar/utils/colors.dart';
import 'package:geotagar/utils/global_variables.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
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
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/forgotPasswordBG.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(31, 0, 0, 0),
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
      ),
    );
  }
}
