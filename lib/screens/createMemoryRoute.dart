import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/screens/create_memory.dart';

class CMRoute extends StatefulWidget {
  const CMRoute({super.key});

  @override
  State<CMRoute> createState() => _CMRouteState();
}

class _CMRouteState extends State<CMRoute> {
  late List<CameraDescription> _cams;

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

  @override
  Widget build(BuildContext context) {
    return CreateMemory(cameras: _cams);
  }
}
