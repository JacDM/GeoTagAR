// ignore_for_file: avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geotagar/screens/discoverPages/group_page.dart';
import 'package:geotagar/screens/userAccountScreens/user_profile.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../utils/text_field.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection('users');
  final TextEditingController _searchTextController = TextEditingController();
  bool showUsers = false;

  @override
  void initState() {
    super.initState();
    _searchTextController.addListener(_updateClearIconAndDisplay);
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged(String text) {
    setState(() {
      showUsers = text.isNotEmpty;
    });
  }

  void _updateClearIconAndDisplay() {
    setState(() {
      showUsers = _searchTextController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                ReusableTextField(
                  controller: _searchTextController,
                  hintText: 'Search',
                  onChanged: (text) => _updateClearIconAndDisplay(),
                  keyboardType: TextInputType.text,
                  obscure: false,
                  suffix: _searchTextController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              _searchTextController.clear();
                              _updateClearIconAndDisplay();
                            });
                          },
                        )
                      : null,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: showUsers
                ? StreamBuilder<QuerySnapshot>(
                    stream: _firebaseFirestore.snapshots().asBroadcastStream(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          children: [
                            ...snapshot.data!.docs
                                .where(
                                    (QueryDocumentSnapshot<Object?> element) =>
                                        element['username']
                                            .toString()
                                            .toLowerCase()
                                            .contains(_searchTextController.text
                                                .trim()
                                                .toLowerCase()))
                                .map((QueryDocumentSnapshot<Object?> data) {
                              final String username = data.get('username');
                              final String profilePic = data['profilePic'];
                              final String name = data['name'];

                              return ListTile(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => UserProfile(
                                      uid: data['uid'],
                                    ),
                                  ),
                                ),
                                title: Text(username),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(profilePic),
                                ),
                                subtitle: Text(name),
                              );
                            })
                          ],
                        );
                      }
                    })
                : FutureBuilder(
                    // Test group created in firebase
                    future:
                        FirebaseFirestore.instance.collection('groups').get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        itemCount: (snapshot.data! as dynamic).docs.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => GroupPage(
                                    // uid: (snapshot.data! as dynamic).docs[index]
                                    //     ['id'],
                                    ),
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                contentPadding: EdgeInsets.all(0),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    (snapshot.data! as dynamic).docs[index]
                                        ['avatar'],
                                  ),
                                  radius: 16,
                                ),
                                title: Text(
                                  (snapshot.data! as dynamic).docs[index]
                                      ['name'],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      )),
    );
  }
}
