import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class Unity extends StatefulWidget {
  Unity({Key? key}) : super(key: key);

  @override
  _UnityState createState() => _UnityState();
}

class _UnityState extends State<Unity> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  late UnityWidgetController _unityWidgetController;
  late String cloudAnchorID;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _unityWidgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Card(
          margin: const EdgeInsets.all(0),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            children: [
              UnityWidget(
                onUnityCreated: _onUnityCreated,
                onUnityMessage: onUnityMessage,
                useAndroidViewSurface: false,
                borderRadius: BorderRadius.all(Radius.circular(70)),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          //takePicture();
                        },
                        icon: Icon(
                          Icons.flip_camera_ios,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        iconSize: 25,
                        padding: const EdgeInsets.only(bottom: 20, right: 20),
                      ),
                      IconButton(
                        onPressed: () {
                          takePicture();
                        },
                        icon: Icon(
                          Icons.circle_outlined,
                          color: Colors.white,
                        ),
                        iconSize: 35,
                        padding: const EdgeInsets.only(bottom: 15),
                        selectedIcon: Icon(
                          Icons.circle,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            ;
                          });
                        },
                        icon: Icon(
                          Icons.add_to_photos_rounded,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        iconSize: 25,
                        padding: const EdgeInsets.only(bottom: 20, left: 20),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  void setRotationSpeed(String speed) {
    _unityWidgetController.postMessage(
      'Cube',
      'SetRotationSpeed',
      speed,
    );
  }

  void takePicture() {
    _unityWidgetController.postMessage(
        'PersistentCloudAnchorsController', 'captureImage', null);
  }

  void sendText() {
    // _unityWidgetController.postMessage(gameObject, methodName, message)
  }

  void onUnityMessage(message) {
    print('Received message from unity: ${message.toString()}');
    cloudAnchorID = message.toString();
  }

  void onUnitySceneLoaded(SceneLoaded scene) {
    print('Received scene loaded from unity: ${scene.name}');
    print('Received scene loaded from unity buildIndex: ${scene.buildIndex}');
  }

  // Callback that connects the created controller to the unity controller
  void _onUnityCreated(controller) {
    controller.resume();
    this._unityWidgetController = controller;
  }
}
