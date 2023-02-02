// ignore_for_file: avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:geotagar/screens/userAccountScreens/user_profile.dart';
import 'package:geotagar/utils/methods.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utils/text_Field.dart';
import '../userLogIn_Register/log_in.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _Discover_PageState();
}

class _Discover_PageState extends State<DiscoverPage>
    with SingleTickerProviderStateMixin {
  PlatformFile? _file;
  final TextEditingController _searchTextController = TextEditingController();
  bool showUsers = false;
  //late AnimationController _con;

  @override
  void initState() {
    super.initState();
    //_textEditingController = TextEditingController();
    // _con = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 375),
    // );
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Form(
            child: ReusableTextField(
              obscure: false,
              hintText: 'Search',
              controller: _searchTextController,
              textColor: Colors.white,
              // decoration:
              //     const InputDecoration(labelText: 'Search for a user...'),
              onFieldSubmitted: (String _) {
                setState(() {
                  showUsers = true;
                });
                print(_);
              },
            ),
          ),
        ),
        body: showUsers
            ? FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .where(
                      'username',
                      isGreaterThanOrEqualTo: _searchTextController.text,
                    )
                    .get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: (snapshot.data! as dynamic).docs.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UserProfile(
                              uid: (snapshot.data! as dynamic).docs[index]
                                  ['uid'],
                            ),
                          ),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              (snapshot.data! as dynamic).docs[index]
                                  ['profilePic'],
                            ),
                            radius: 16,
                          ),
                          title: Text(
                            (snapshot.data! as dynamic).docs[index]['username'],
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            : Container(
                //Text("Discover"),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('groups')
                          .orderBy('name')
                          .get(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        // SizedBox(height: 200);
                        // const Text("Communities");
                        // const SizedBox(height: 20);
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (ctx, index) => Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: width > 600 ? width * 0.3 : 0,
                                    vertical: width > 600 ? 15 : 0,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListTile(
                                      // leading: CircleAvatar(
                                      //   backgroundImage: NetworkImage(
                                      //     snapshot.data!.docs[index]['profilePic'],
                                      //   ),
                                      //   radius: 16,
                                      // ),
                                      title: Text(
                                        snapshot.data!.docs[index]['name'],
                                      ),
                                      subtitle: Text(
                                        snapshot.data!.docs[index]
                                            ['description'],
                                      ),
                                      trailing: Text(
                                        snapshot
                                            .data!.docs[index]['members'].length
                                            .toString(),
                                      ),
                                    ),
                                  ),
                                )
                            // child: Scaffold(
                            //   snapshot.data!.docs[index].data(),
                            // ),
                            );
                      }),
                ),
              ));
    //: const Text("Communities"));
  }
}

// return Scaffold(
    //   appBar: AppBar(
    //     centerTitle: false,
    //     toolbarHeight: 90,
    //     //used to remove the back button from appBar
    //     automaticallyImplyLeading: false,
    //     backgroundColor: Colors.black,
    //     title: const Text(
    //       "Discover",
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontSize: 30,
    //         fontWeight: FontWeight.w900,
    //         //fontFamily: 'arial',
    //       ),
    //     ),
    //   ),
    //   backgroundColor: Colors.black,
    //   body: Container(
    //       color: Colors.black,
    //       //child: body[_currentIndex],
    //       child: Padding(
    //           padding: EdgeInsets.fromLTRB(
    //               20, MediaQuery.of(context).size.height * 0.005, 20, 0),
    //           child: Column(children: [
    //             // const Text("Discover",
    //             //     style: TextStyle(
    //             //       color: Colors.black,
    //             //       fontSize: 25,
    //             //       fontWeight: FontWeight.bold,
    //             //     )),
    //             //const SizedBox(height: 20),
    //             ReusableTextField(
    //               obscure: false,
    //               controller: _searchTextController,
    //               hintText: "Search",
    //               textColor: Colors.white,
    //               onFieldSubmitted: (String _) {
    //                 setState(() {
    //                   showUsers = true;
    //                 });
    //               },
    //             ),
    //             body: showUsers
    //                 ? FutureBuilder(
    //                     future: FirebaseFirestore.instance
    //                         .collection('users')
    //                         .where('username',
    //                             isGreaterThanOrEqualTo:
    //                                 _searchTextController.text.trim())
    //                         .get(),
    //                     builder: (context, snapshot) {
    //                       if (!snapshot.hasData) {
    //                         return const Center(
    //                             child: CircularProgressIndicator());
    //                       }
    //                       return ListView.builder(
    //                         shrinkWrap: true,
    //                         // physics: const BouncingScrollPhysics(),
    //                         itemCount: (snapshot.data! as dynamic).docs.length,
    //                         itemBuilder: (context, index) {
    //                           //DocumentSnapshot user = snapshot.data!.docs[index];
    //                           return InkWell(
    //                             onTap: () {
    //                               Navigator.push(
    //                                   context,
    //                                   MaterialPageRoute(
    //                                       builder: (context) => UserProfile(
    //                                             uid: (snapshot.data! as dynamic)
    //                                                 .docs[index]['uid'],
    //                                           )));
    //                             },
    //                             child: ListTile(
    //                               leading: CircleAvatar(
    //                                 backgroundImage: NetworkImage(
    //                                     (snapshot.data! as dynamic).docs[index]
    //                                         ['profilePic']),
    //                               ),
    //                               title: Text((snapshot.data! as dynamic)
    //                                   .docs[index]['username']),
    //                             ),
    //                           );
    //                         },
    //                       );
    //                     })
    //                 : const Text("Communities"),
    //           ]))),
        //);