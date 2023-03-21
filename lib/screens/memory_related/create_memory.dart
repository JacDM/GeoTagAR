//import 'dart:html';

import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cross_file_image/cross_file_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';

import 'package:geotagar/screens/memory_related/post_memory.dart';
import 'package:geotagar/utils/methods.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cross_file/cross_file.dart';
import 'package:crop_image/crop_image.dart';
//import 'package:image/image.dart' as im;
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
  static XFile? imagefile;
  bool flash = false;

  //late ImageStream? _imageStream;
  //late Uint8List? _bytes;

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras![0]);
  }

  @override
  void dispose() {
    super.dispose();
    _cam.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      //floatingActionButton: getFloatingButtons(),
      body: getBody(),
    );
  }

  Future initCamera(CameraDescription camDesc) async {
    _cam = CameraController(camDesc, ResolutionPreset.max);
    try {
      await _cam.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on Exception catch (e) {
      debugPrint("error with camera: $e");
    }
  }

  _cropImage(XFile file) async {
    File tempFile = File(file.path);

    // Navigator.push(context,
    //     MaterialPageRoute(builder: (builder) => Cropper(image: croppedImg)));
    
      final croppedImg = await ImageCropper()
          .cropImage(sourcePath: tempFile.path, aspectRatioPresets: [
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio4x3,
      ], uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop/Resize',
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.ratio16x9,
            lockAspectRatio: true),
        IOSUiSettings(title: 'Crop/Resize'),
        WebUiSettings(
          context: context,
          customDialogBuilder: (cropper, crop, rotate) {
            return Dialog(
              child: Builder(builder: (context) {
                return Container();
              }),
            );
          },
        ),
      ]);

      if (croppedImg != null) {
        imageCache.clear();
        setState(() {
          imagefile = XFile(croppedImg.path);
        });
      }
    

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => AddPost(
                  image: imagefile!,
                )));

    //return XFile(tempFile.path);
  }

  Future _takePicture(BuildContext context) async {
    if (_cam.value.isInitialized) {
      XFile picFiletemp = await _cam.takePicture();
      if (picFiletemp != null) {
        _cropImage(picFiletemp);
      }
      // setState(() {
      //   imagefile = picFiletemp;
      // });
    }
  }

  _openGallery() async {
    imagefile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imagefile != null) {
      _cropImage(imagefile!);
    } else {
      showSnackBar(context, 'No image selected!');
    }
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
                  // circleloading icon while loading
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
                      _takePicture(context);
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
}

// class Cropper extends StatefulWidget {
//   const Cropper({super.key, required this.image});

//   final Image image;
//   @override
//   State<Cropper> createState() => _CropperState();
// }

// class _CropperState extends State<Cropper> {
//   final _cropCtrler = CropController(
//     aspectRatio: 16 / 9,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Crop/Resize'),
//       ),
//       body: Center(
//         child: CropImage(
//           controller: _cropCtrler,
//           image: widget.image,
//           paddingSize: 25,
//           alwaysMove: true,
//         ),
//       ),
//       bottomNavigationBar: _buttons(),
//     );
//   }

//   aspectRatios() {
//     Navigator.pop(context);
//   }

//   _finished() async {
//     final Image imgAsImage = await _cropCtrler.croppedImage();
//     await rootBundle.load();
//     //im.Image imgAsNewImage = imgAsImage;

//     final imgAsBytes = await io.File(imgAsImage).readAsBytes();
//     Navigator.push(context,
//         MaterialPageRoute(builder: (builder) => AddPost(image: image)));
//   }

//   _buttons() {
//     String val = '16:9';
//     List<DropdownMenuItem> ratios = [
//       DropdownMenuItem(child: Text('16:9')),
//       DropdownMenuItem(child: Text('4:3')),
//     ];
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         IconButton(
//           onPressed: () {
//             _cropCtrler.rotation = CropRotation.up;
//             _cropCtrler.crop = Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
//             _cropCtrler.aspectRatio = 16 / 9;
//           },
//           icon: Icon(Icons.close),
//         ),
//         DropdownButton(value: val, items: ratios, onChanged: aspectRatios()),
//         IconButton(
//           onPressed: () => _cropCtrler.rotateLeft(),
//           icon: Icon(Icons.rotate_left),
//         ),
//         IconButton(
//           onPressed: () => _cropCtrler.rotateRight(),
//           icon: Icon(Icons.rotate_right),
//         ),
//         IconButton(
//           onPressed: _finished(),
//           icon: Icon(Icons.close),
//         ),
//       ],
//     );
//   }
// }


