import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:anim_search_bar/anim_search_bar.dart';

class CreateMemory extends StatefulWidget {
  const CreateMemory({super.key, required this.cameras});

  final List<CameraDescription>? cameras;

  @override
  State<CreateMemory> createState() => _CreateMemoryState();
}

class _CreateMemoryState extends State<CreateMemory> {
  late CameraController _cam;
  bool _isrearCam = true;
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      floatingActionButton: getFloatingButtons(),
      body: getBody(),
    );
  }

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras![0]);
  }

  Future initCamera(CameraDescription camDesc) async {
    _cam = CameraController(camDesc, ResolutionPreset.max);
    try {
      await _cam.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("Error! $e");
    }
  }

  @override
  void dispose() {
    _cam.dispose();
    super.dispose();
  }

  Widget getBody() {
    return SafeArea(
        child: Stack(
      children: [
        (_cam.value.isInitialized)
            ? CameraPreview(_cam)
            : Container(
                color: Colors.black,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() => _isrearCam = !_isrearCam);
                    initCamera(widget.cameras![_isrearCam ? 0 : 1]);
                  },
                  icon: const Icon(
                    Icons.flip_camera_ios,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                  padding: EdgeInsets.zero,
                )
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget getFloatingButtons() {
    return Padding(
      //search bar
      padding: const EdgeInsets.only(top: 50, left: 35),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search_rounded),
                  color: Colors.white.withOpacity(0.75),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
