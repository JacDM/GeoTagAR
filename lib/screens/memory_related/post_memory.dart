import 'dart:html';

import 'package:camera/camera.dart';
import 'package:cross_file_image/cross_file_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/core/constants/constants.dart';
import 'package:geotagar/main.dart';
import 'package:image/image.dart' as Im;
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';

class AddPost extends StatefulWidget {
  const AddPost(
      {super.key,
      //required this.cameraController,
      //this.currentUser
      required this.image});

  //final CameraController cameraController;
  //final currentUser;
  final XFile image;

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  bool isUploading = false;
  final TextEditingController _descCtrler = TextEditingController();
  String postId = Uuid().v4();
  Uint8List? file;

  compressImage(
      //XFile img

      ) async {
    //this will convert XFile image to Uint8list
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;

    Uint8List compressedImg = await widget.image.readAsBytes();

    // Im.Image imageFile = Im.decodeImage(file.readAsBytesSync());
    // final compressedImageFile = File('$path/img_$postId.jpg');
    // final compressedImg = await img.read

    setState(() {
      file = compressedImg;
    });
  }

  handleSubmit() async {
    setState(() {
      isUploading = true;
    });

    await compressImage();
    //await uploadImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text('Post Memory'),
        centerTitle: false,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        minimum: const EdgeInsets.all(4),
        child: Column(children: [
          //linear indicator
          isUploading
              ? const LinearProgressIndicator()
              : const Padding(padding: EdgeInsets.all(0)),
          const Padding(padding: EdgeInsets.all(4)),

          //post
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //the pic
                Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        foregroundDecoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            image: DecorationImage(
                                image: MemoryImage(
                                    file!), //Image(image: XFileImage(widget.image)).image,
                                fit: BoxFit.cover,
                                alignment: FractionalOffset.topCenter)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Padding(padding: EdgeInsets.all(0)),
          Container(), //for the location
          const Padding(padding: EdgeInsets.all(0)),

          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.9, //
            child: Row(children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.08,
                child: Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const CircleAvatar(
                      backgroundImage: null,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _descCtrler,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.add_comment,
                        color: Colors.grey.shade700,
                      ),
                      prefixIconColor: Colors.white70,
                      hintText: 'Add a caption...',
                      hintStyle:
                          TextStyle(color: Colors.grey.shade700, fontSize: 15)),
                ),
              )
            ]),
          ),
          const Padding(padding: EdgeInsets.all(0)),

          Container(), //location button
        ]),
      ),
      //the "post" button
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 5, right: 5),
        child: Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            onPressed: isUploading ? null : () => handleSubmit(),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Colors.deepOrange.shade900),
              minimumSize: MaterialStatePropertyAll<Size>(Size(
                  MediaQuery.of(context).size.width * 0.135,
                  MediaQuery.of(context).size.height * 0.075)),
            ),
            child: Text(
              'Post',
              style: TextStyle(fontSize: 17.5),
            ),
          ),
        ),
      ),
    );
  }
}

// class PreviewPage extends StatelessWidget {
//   const PreviewPage({
//     super.key,
//     //required this.path
//   });
//   //final String path;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//       ),
//       body: Container(),
//       floatingActionButton: IconButton(
//         onPressed: () {},
//         alignment: Alignment.bottomRight,
//         color: Colors.black,
//         icon: Icon(
//           Icons.arrow_forward,
//         ),
//         padding: EdgeInsets.only(bottom: 8, right: 8),
//       ),
//     );
//   }
// }
