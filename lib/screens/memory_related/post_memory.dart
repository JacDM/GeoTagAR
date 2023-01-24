import 'dart:html';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/main.dart';

class AddPost extends StatefulWidget {
  const AddPost({
    super.key,
    required this.camCtrl,
    //this.currentUser
    //required this.image
  });

  final CameraController camCtrl;
  //final currentUser;
  //final XFile image;

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  bool isLoading = false;
  final TextEditingController _descCtrler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text('Post Memory'),
        centerTitle: false,
      ),
      backgroundColor: Colors.white54,
      body: Column(
        children: [
        //linear indicator
        isLoading
            ? const LinearProgressIndicator()
            : const Padding(padding: EdgeInsets.all(0)),
        const Divider(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //the pic
            Container(
              height: 220,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Center(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    decoration: const BoxDecoration(
                        /// image: DecorationImage(
                        ///     fit: BoxFit.fill,
                        ///     alignment: FractionalOffset.topCenter,
                        ///     image: FileImage(file))
                        ),
                  ),
                ),
              ),
            ),


            Padding(padding: EdgeInsets.only(top: 10)),


            const ListTile(
              leading: CircleAvatar(
                backgroundImage: null,
              ),
            ),


          ],
        ),
        Container(
          height: 300,
          width: 100,
          child: Center(),
        )
      ]),
    );
    // Center(
    //   child: IconButton(
    //     icon: const Icon(Icons.upload),
    //     onPressed: () {},
    //   ),
    // );
  }
}

//
//
//
//
//
//

class PreviewPage extends StatelessWidget {
  const PreviewPage({
    super.key,
    //required this.path
  });
  //final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(),
      floatingActionButton: IconButton(
        onPressed: () {},
        alignment: Alignment.bottomRight,
        color: Colors.black,
        icon: Icon(
          Icons.arrow_forward,
        ),
        padding: EdgeInsets.only(bottom: 8, right: 8),
      ),
    );
  }
}
