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
  final TextEditingController _locationCtrler = TextEditingController();
  String postId = Uuid().v4();
  Uint8List? file;

  @override
  void dispose() {
    _descCtrler.dispose();
    _locationCtrler.dispose();
    super.dispose();
  }

  compressImage(
      //XFile img

      ) async {
    //this will convert XFile image to Uint8list
    //final tempDir = await getTemporaryDirectory();
    //final path = tempDir.path;

    Uint8List compressedImg = await widget.image.readAsBytes();

    // Im.Image imageFile = Im.decodeImage(file.readAsBytesSync());
    // final compressedImageFile = File('$path/img_$postId.jpg');
    // final compressedImg = await img.read

    setState(() {
      file = compressedImg;
    });
  }

  uploadImage() {}

  handleSubmit() async {
    setState(() {
      isUploading = true;
    });

    await compressImage();
    //await uploadImage();

    // setState(() {
    //   isUploading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        foregroundColor: Colors.white,
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
      backgroundColor: Colors.white,
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
                            border: Border.all(color: Colors.black, width: 1),
                            image: DecorationImage(
                                image: Image(image: XFileImage(widget.image))
                                    .image,
                                // isUploading
                                //     ? MemoryImage(file!)
                                //     : Image(
                                //             image: NetworkImage(
                                //                 'https://images.unsplash.com/photo-1668018367039-22526ebf2461?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=439&q=80'))
                                //         .image, //
                                fit: BoxFit.contain,
                                alignment: FractionalOffset.topCenter)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.08,
                  child: Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: Container(),
                  ),
                ),
                Container(
                  //height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: TextFormField(
                      mouseCursor: SystemMouseCursors.forbidden,
                      enabled: false,
                      controller: _locationCtrler,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[300],
                          prefixIconColor: Colors.white70,
                          hintText: 'Where was this picture taken?',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade700, fontSize: 12)),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Container(
                    //height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Tooltip(
                      waitDuration: Duration(seconds: 2),
                      showDuration: Duration(seconds: 1),
                      message: 'Long press to clear location',
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _locationCtrler.value =
                                TextEditingValue(text: 'location!!');
                          });
                        },
                        onLongPress: () {
                          setState(() {
                            _locationCtrler.clear();
                          });
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Location cleared.'),
                            duration: Duration(seconds: 4),
                          ));
                        },
                        label: Text(
                          'Use current location',
                          style: TextStyle(fontSize: 12),
                        ),
                        icon: Icon(Icons.my_location_outlined),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                      ),
                    ))
              ],
            ),
          ), //for the location

          SizedBox(
            height: 0,
          ),

          Container(
            height: MediaQuery.of(context).size.height * 0.125,
            width: MediaQuery.of(context).size.width * 0.9, //
            child: Row(children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.08,
                padding: EdgeInsets.only(right: 10),
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
          SizedBox(
            height: 0,
          )
        ]),
      ),
      //the "post" button
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 5, right: 5),
        child: Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            onPressed: isUploading
                ? null
                : () => handleSubmit(), //() => handleSubmit(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange.shade900,
              disabledBackgroundColor: Colors.grey[600],
              disabledMouseCursor: SystemMouseCursors.forbidden,
              minimumSize: Size(MediaQuery.of(context).size.width * 0.135,
                  MediaQuery.of(context).size.height * 0.075),
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
