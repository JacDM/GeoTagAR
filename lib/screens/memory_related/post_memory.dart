import 'package:camera/camera.dart';
import 'package:cross_file_image/cross_file_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geotagar/ar/ar.dart';
import 'package:geotagar/core/constants/constants.dart';
import 'package:geotagar/layout/layout_select.dart';
import 'package:geotagar/layout/mobile_layout.dart';
import 'package:geotagar/layout/web_layout.dart';
import 'package:geotagar/main.dart';
import 'package:geotagar/models/users.dart';
import 'package:geotagar/providers/user_provider.dart';
//import 'package:image/image.dart' as Im;
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';
import 'package:geotagar/services/firestore.dart';
import 'package:geolocator/geolocator.dart';
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
  //String postId = Uuid().v4();
  String postId = const Uuid().v1();
  Uint8List? file;
  double lat = 15000;
  double long = 15000;
  bool locationSet = false;
  bool normalmode = true;

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
      if (lat != 15000 && long != 15000) {
        setState(() => locationSet = true);
        String res = await FireStoreMethods().uploadPost(_descCtrler.text,
            file!, uid, username, profImage, lat, long, postId);
        if (res == 'success') {
          setState(() {
            isUploading = false;
          });
          showSnackBar(context, 'Posted!');
          clearImage();
        } else {
          showSnackBar(context, res);
        }
      } else {
        showSnackBar(context, "Must set a location to post!");
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
    if (locationSet == true && normalmode == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) =>
                LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return WebScreenLayout();
                  }
                  return MobileScreenLayout();
                })),
      );
    }

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
    Position pos = await _determinePosition();
    setState(() {
      lat = pos.latitude;
      long = pos.longitude;
    });
    List<Placemark> placemarks =
        await placemarkFromCoordinates(pos.latitude, pos.longitude);
    Placemark placemark = placemarks.first;
    setState(() {
      locationSet = true;
      _locationCtrler.value = TextEditingValue(
          text: '${placemark.administrativeArea}, ${placemark.country}');
    });
    //${placemark.thoroughfare},
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
                            border: Border.all(color: Colors.white, width: 0.5),
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
            height: 20,
          ),

          Container(
            //height: MediaQuery.of(context).size.height * 0.1,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextFormField(
              mouseCursor: SystemMouseCursors.forbidden,
              enabled: false,
              controller: _locationCtrler,
              style: TextStyle(color: Colors.white, fontSize: 12),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: (bgcol == Colors.white)
                      ? Colors.grey[300]
                      : Color.fromARGB(255, 78, 78, 78),
                  prefixIconColor: Colors.white70,
                  hintText:
                      'Must provide the post location! (long press to clear)',
                  hintStyle: TextStyle(
                      color: (bgcol == Colors.white)
                          ? Colors.grey.shade700
                          : Color.fromARGB(255, 225, 222, 222),
                      fontSize: 12)),
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
          Container(
              alignment: Alignment.topLeft,
              height: MediaQuery.of(context).size.height * 0.063,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Tooltip(
                waitDuration: Duration(seconds: 2),
                showDuration: Duration(seconds: 1),
                message: 'Long press to clear location',
                child: ElevatedButton.icon(
                  onPressed: () {
                    getLocation();
                  },
                  onLongPress: () {
                    setState(() {
                      locationSet = false;
                      _locationCtrler.clear();
                    });
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
              )),

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
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 25),
            child: Align(
                alignment: Alignment(1, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Visibility(
                      visible: (!kIsWeb),
                      child: ElevatedButton(
                        onPressed: ((isUploading) || (_locationCtrler == null))
                            ? null
                            : () {
                                setState(() {
                                  normalmode = false;
                                });
                                handleSubmit(
                                    user.uid, user.username, user.profilePic);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            ARState(postId: postId)));

                                //Navigator.of(context).push(MaterialPageRoute())
                              }, //() => handleSubmit(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 13, 110, 0),
                          disabledBackgroundColor: Colors.grey[600],
                          disabledMouseCursor: SystemMouseCursors.forbidden,
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.425,
                              MediaQuery.of(context).size.height * 0.075),
                        ),
                        child: Text(
                          'Add AR anchor',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                    const Visibility(
                      visible: (!kIsWeb),
                      child: SizedBox(
                        width: 35,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: ((isUploading) || (locationSet == false))
                          ? null
                          : () {
                              //print(locationSet);
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
                        fixedSize: Size(
                            (!kIsWeb)
                                ? MediaQuery.of(context).size.width * 0.425
                                : MediaQuery.of(context).size.width * 0.9,
                            MediaQuery.of(context).size.height * 0.075),
                      ),
                      child: Text(
                        'Post',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
