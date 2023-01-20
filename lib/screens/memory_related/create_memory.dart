import 'dart:html';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/screens/homepage.dart';
import 'package:geotagar/screens/memory_related/post_memory.dart';
import 'package:image_picker/image_picker.dart';

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
  //TextEditingController textController = TextEditingController();
  static XFile? imagefile;

  late ImageStream? _imageStream;
  late Uint8List? _bytes;

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

  _openGallery() async {
    //Navigator.pop(context);

    imagefile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {});
    //if (!context.mounted) return;
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => PreviewPage()));
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
            height: MediaQuery.of(context).size.height * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() => _isrearCam = !_isrearCam);
                    initCamera(widget.cameras![_isrearCam ? 0 : 1]);
                  },
                  icon: Icon(
                    Icons.flip_camera_ios,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  iconSize: 25,
                  padding: const EdgeInsets.only(bottom: 20, right: 20),
                ),
                IconButton(
                  onPressed: () async {
                    try {
                      if (_cam.value.isInitialized) {
                        //imagefile = await _cam.takePicture();
                        setState(() {
                          //this.imagefile = _image;
                        });
                      }
                    } catch (e) {
                      debugPrint('Camera exception $e');
                    }
                  },
                  icon: const Icon(
                    Icons.circle_outlined,
                    color: Colors.white,
                  ),
                  iconSize: 35,
                  padding: const EdgeInsets.only(bottom: 15),
                  selectedIcon: const Icon(
                    Icons.circle,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () => _openGallery(),
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
    ));
  }

  Widget getFloatingButtons() {
    return Padding(
      //search bar
      padding: const EdgeInsets.only(top: 50, left: 35, right: 35),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
