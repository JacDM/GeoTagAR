import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/screens/memory_related/create_memory.dart';
import 'package:geotagar/screens/memory_related/post_memory.dart';
import 'package:image_picker/image_picker.dart';

late List<CameraDescription> _cams;

class CMRoute extends StatefulWidget {
  const CMRoute({
    super.key,
    //required this.currentUser
  });

  //final User currentUser;

  @override
  State<CMRoute> createState() => _CMRouteState();
}

class _CMRouteState extends State<CMRoute> {
  static XFile? imagefile;

  @override
  void initState() {
    super.initState();
    _setupCams();
  }  

  Future<List<CameraDescription>> _setupCams() async {
    try {
      _cams = await availableCameras();
    } on CameraException catch (_) {
      debugPrint('Camera exception: $_');
    }
    return _cams;
  }

  @override
  Widget build(BuildContext context) {
    //return _setupCams();//_openGallery(); //CreateMemory(cameras: _cams);
    return FutureBuilder(
      future: _setupCams(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final cams = snapshot.data;
            return CreateMemory(cameras: cams);
          } 
        }
        return Text('error has occured');
      },
    );
  }
}
