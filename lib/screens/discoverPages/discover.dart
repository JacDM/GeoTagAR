import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../userLogIn_Register/log_in.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _Discover_PageState();
}

class _Discover_PageState extends State<DiscoverPage> {
  PlatformFile? _file;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(),
      body: Container(
        //child: body[_currentIndex],

        child: Column(children: [
          ElevatedButton(
              child: Text("Sign out"),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("User has signed out");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LogIn()));
                });
              }),
          SizedBox(height: 20),
          if (_file != null)
            Expanded(
                child: Container(
              child: Text(_file!.name),
            )),
          SizedBox(height: 20),
          ElevatedButton(
              child: Text("Select file"),
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles();
                if (result != null) {
                  setState(() {
                    _file = result.files.first;
                  });
                }
              }),
          SizedBox(height: 10),
          ElevatedButton(
              child: Text("Upload file"),
              onPressed: () async {
                final path = 'testImage/my-image.jpg';
                final result = await FilePicker.platform
                    .pickFiles(type: FileType.any, allowMultiple: false);

                if (result != null && result.files.isNotEmpty) {
                  final fileBytes = result.files.first.bytes;
                  final fileName = result.files.first.name;

                  // upload file
                  await FirebaseStorage.instance
                      .ref('uploads/$fileName')
                      .putData(fileBytes!);
                }
              }),
        ]),
      ),
    ));
  }
}
