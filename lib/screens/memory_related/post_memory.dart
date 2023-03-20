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
import 'package:cloud_firestore/cloud_firestore.dart';

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

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
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
    setState(() {
      _locationCtrler.value = TextEditingValue(text: '$position');
    });
  }

  Color bgcol = Colors.black;

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
        backgroundColor: bgcol,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //the pic
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 4.5 / 3,
                        child: Container(
                          foregroundDecoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 0.5),
                              image: DecorationImage(
                                  image: Image(image: XFileImage(widget.image))
                                      .image,
                                  fit: BoxFit.contain,
                                  alignment: FractionalOffset.center)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
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
                            fillColor: (bgcol == Colors.white)
                                ? Colors.grey[300]
                                : Color.fromARGB(255, 78, 78, 78),
                            prefixIconColor: Colors.white70,
                            hintText: 'Where was this picture taken?',
                            hintStyle: TextStyle(
                                color: (bgcol == Colors.white)
                                    ? Colors.grey.shade700
                                    : Color.fromARGB(255, 225, 222, 222),
                                fontSize: 12)),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.063,
                      width: MediaQuery.of(context).size.width * 0.33,
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
                              backgroundColor: Color.fromARGB(255, 7, 63, 108)),
                        ),
                      ))
                ],
              ),
            ), //for the location
            SizedBox(
              height: 0,
            ),
            Container(
              //padding: EdgeInsets.only(bottom: 50),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.9, //
              child: Row(children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.height * 0.1,
                  padding: EdgeInsets.only(right: 10),
                  child: Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.profilePic),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: TextFormField(
                    style: TextStyle(
                        color: (bgcol == Colors.white)
                            ? Colors.black
                            : Colors.white),
                    controller: _descCtrler,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.add_comment,
                          color: Colors.grey.shade700,
                        ),
                        prefixIconColor: Colors.white70,
                        hintText: 'Add a caption...',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                        )),
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
        floatingActionButton: Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: Padding(
            padding: EdgeInsets.only(bottom: 5, right: 5),
            child: Align(
              alignment: Alignment(1.03, 1.03),
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
                  backgroundColor: Color.fromARGB(255, 27, 1, 78),
                  disabledBackgroundColor: Colors.grey[600],
                  disabledMouseCursor: SystemMouseCursors.forbidden,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.9,
                      MediaQuery.of(context).size.height * 0.075),
                ),
                child: Text(
                  'Post',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
        ));
  }
}
