import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/user_provider.dart';

class LayoutSelect extends StatefulWidget {
  final Widget mobileLayout;
  final Widget webLayout;
  const LayoutSelect(
      {super.key, required this.mobileLayout, required this.webLayout});

  @override
  State<LayoutSelect> createState() => _LayoutSelectState();
}

class _LayoutSelectState extends State<LayoutSelect> {
  @override
  void initState() {
    super.initState();
    //addData();
  }

  // addData() async {
  //   UserProvider _userProvider =
  //       Provider.of<UserProvider>(context, listen: false);
  //   await _userProvider.refreshUser();
  // }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        //&& constraints.maxHeight > 450) {
        // 600 can be changed to 900 if you want to display tablet screen with mobile screen layout
        return widget.webLayout;
      }
      return widget.mobileLayout;
    });
  }
}
