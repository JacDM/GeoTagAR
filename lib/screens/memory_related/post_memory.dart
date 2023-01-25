import 'dart:html';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/main.dart';

class AddPost extends StatefulWidget {
  const AddPost(
      {super.key,
      //required this.cameraController,
      //this.currentUser
      required this.image});

  //final CameraController cameraController;
  //final currentUser;
  final Image image;

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
      body: Column(children: [
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
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1490077476659-095159692ab5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2NlbmV8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60'),
                            fit: BoxFit.fill,
                            alignment: FractionalOffset.topCenter)),
                  ),
                ),
              ),
            ),
          ],
        ),

        Divider(),
        Container(
          height: 300,
          width: 100, //
          child: Center(),
        ),

        const ListTile(
          leading: CircleAvatar(
            backgroundImage: null,
          ),
        ),
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
