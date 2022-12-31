import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';


class UnityAR extends StatefulWidget {

  const UnityAR({super.key});

  @override
  _UnityAR createState() => _UnityAR();
}

class _UnityAR extends State<UnityAR>{
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  late UnityWidgetController _unityWidgetController;

  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        bottom: false,
        child: Container(
            color: Color.fromARGB(255, 0, 255, 0),
            child: UnityWidget(
              onUnityCreated: onUnityCreated,
            ),
          ),
      ),
    );
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    this._unityWidgetController = controller;
  }
}
