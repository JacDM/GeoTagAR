import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/screens/memory_related/create_memory.dart';
import 'package:geotagar/screens/memory_related/post_memory.dart';
import 'package:image_picker/image_picker.dart';

class CMRoute extends StatefulWidget {
  const CMRoute({super.key, 
  //required this.currentUser
  });

  //final User currentUser;

  @override
  State<CMRoute> createState() => _CMRouteState();
}

class _CMRouteState extends State<CMRoute> {
  late List<CameraDescription> _cams;
  static XFile? imagefile;

  @override
  void initState() {
    super.initState();
    _setupCams();
  }

  Future<void> _setupCams() async {
    try {
      _cams = await availableCameras();
    } on CameraException catch (_) {
      debugPrint('Camera exception: $_');
    }
  }

  _openGallery() async {
    //Navigator.pop(context);

    imagefile = await ImagePicker().pickImage(source: ImageSource.gallery);
    //Image imageUpload = Image(image: XFileImage(imagefile!));
    setState(() {});
    //if (!context.mounted) return;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => AddPost(
                  image: imagefile!,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return _openGallery(); //CreateMemory(cameras: _cams);
  }
}
