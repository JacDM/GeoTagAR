import 'package:camera/camera.dart';
import 'package:cross_file_image/cross_file_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/core/constants/constants.dart';
import 'package:geotagar/layout/layout_select.dart';
import 'package:geotagar/layout/mobile_layout.dart';
import 'package:geotagar/layout/web_layout.dart';
import 'package:geotagar/main.dart';
import 'package:geotagar/models/users.dart';
import 'package:geotagar/providers/user_provider.dart';
import 'package:image/image.dart' as Im;
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';
import 'package:geotagar/services/firestore.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:geoflutterfire/geoflutterfire.dart';

import '../../providers/user_provider.dart';
import '../../utils/methods.dart';
import 'package:geotagar/screens/map.dart';

class AddPost extends StatefulWidget {
  const AddPost({
    super.key,
    //required this.cameraController,
    //this.currentUser
    required this.image,
  });
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

  compressImage() async {
    Uint8List compressedImg = await widget.image.readAsBytes();
    setState(() {
      file = compressedImg;
    });
  }

  clearImage() {
    setState(() {
      file = null;
    });
  }

  uploadImage(String uid, String username, String profImage) async {
    try {
      String res = await FireStoreMethods()
          .uploadPost(_descCtrler.text, file!, uid, username, profImage);
      if (res == 'success') {
        setState(() {
          isUploading = false;
        });
        showSnackBar(context, 'Posted!');
        clearImage();
      } else {
        showSnackBar(context, res);
      }
    } catch (err) {
      setState(() {
        isUploading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  handleSubmit(String uid, String username, String profImage) async {
    setState(() {
      isUploading = true;
    });
    await compressImage();
    await uploadImage(uid, username, profImage);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (builder) => LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return WebScreenLayout();
                }
                return MobileScreenLayout();
              })),
    );

    // setState(() {
    //   isUploading = false;
    // });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
  }

  getLocation() async {
    Position position = await _determinePosition();
    //List<> placemarks = await Geolocator().placemarks
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserProvider>(context).getUser;
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
        child: SingleChildScrollView(
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
                      aspectRatio: 4.5 / 3,
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
                // Container(
                //   width: MediaQuery.of(context).size.width * 0.08,
                //   child: Flexible(
                //     flex: 2,
                //     fit: FlexFit.loose,
                //     child: Container(),
                //   ),
                // ),
                Container(
                  //height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.5,
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
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.3,
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
            height: MediaQuery.of(context).size.height * 0.15,
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
                  style: TextStyle(color: Colors.black),
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
        ])),
      ),
      //the "post" button
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 5, right: 5),
        child: Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            onPressed: isUploading
                ? null
                : () {
                    handleSubmit(
                      user.uid,
                      user.username,
                      user.profilePic,
                    );
                  }, //() => handleSubmit(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 16, 80, 3),
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
