import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';


class NUnityAR extends StatefulWidget {

  const NUnityAR({super.key});

  @override
  _NUnityAR createState() => _NUnityAR();
}

class _NUnityAR extends State<NUnityAR>{
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
  void onUnityMessage(message) {
    print('Received message from unity: ${message.toString()}');
  }

  void onUnitySceneLoaded(SceneLoaded scene) {
    print('Received scene loaded from unity: ${scene.name}');
    print('Received scene loaded from unity buildIndex: ${scene.buildIndex}');
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    this._unityWidgetController = controller;
  }
}
