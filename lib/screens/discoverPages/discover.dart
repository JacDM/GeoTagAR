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
import '../../utils/text_Field.dart';

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
    // return Container(
    //   child: Container(
    //       padding: Vx.m24,
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           "Discover"
    //               .text
    //               .xl3
    //               .bold
    //               .color(const Color.fromARGB(255, 54, 54, 54))
    //               .make(),
    //           CupertinoSearchTextField(
    //             controller: _searchTextController,
    //             onChanged: (value) {
    //               setState(() {
    //                 showUsers = true;
    //               });
    //             },
    //           ).py12(),
    //         ],
    //       )),

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: Form(
            child: ReusableTextField(
              obscure: false,
              hintText: 'Search',
              controller: _searchTextController,
              textColor: Colors.white,
              // decoration:
              //     const InputDecoration(labelText: 'Search for a user...'),
              onFieldSubmitted: (String _) {
                if (_searchTextController.text.isNotEmpty) {
                  setState(() {
                    showUsers = true;
                  });
                }

                print(_);
              },
            ),
          ),
        ),
        body: showUsers
            ? StreamBuilder<QuerySnapshot>(
                stream: _firebaseFirestore.snapshots().asBroadcastStream(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    print(snapshot.data);

                    return ListView(
                      children: [
                        ...snapshot.data!.docs
                            .where((QueryDocumentSnapshot<Object?> element) =>
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

                    // return ListView(
                    //   children: snapshot.data!.docs.wheremap((DocumentSnapshot document) {
                    //     return ListTile(
                    //       title: Text(document.data()!['username']),
                    //       subtitle: Text(document.data()!['email']),
                    //     );
                    //   }).toList(),
                    // );
                  }
                })
            : FutureBuilder(
                // Test group created in firebase
                future: FirebaseFirestore.instance.collection('groups').get(),
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
                            builder: (context) => GroupPage(
                                // uid: (snapshot.data! as dynamic).docs[index]
                                //     ['id'],
                                ),
                          ),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              (snapshot.data! as dynamic).docs[index]['avatar'],
                            ),
                            radius: 16,
                          ),
                          title: Text(
                            (snapshot.data! as dynamic).docs[index]['name'],
                          ),
                        ),
                      );
                    },
                  );
                },
              ));
  }

//   Widget buildResults(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//         stream: _firebaseFirestore.snapshots().asBroadcastStream(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             print(snapshot.data);

//             return ListView(
//               children: [
//                 ...snapshot.data!.docs
//                     .where((QueryDocumentSnapshot<Object?> element) =>
//                         element['username'].toString().toLowerCase().contains(
//                             _searchTextController.text.trim().toLowerCase()))
//                     .map((QueryDocumentSnapshot<Object?> data) {
//                   final String username = data.get('username');
//                   final String profilePic = data['profilePic'];
//                   final String name = data['name'];

//                   return ListTile(
//                     // onTap: () => Navigator.of(context).push(
//                     //   MaterialPageRoute(
//                     //     builder: (context) => UserProfile(
//                     //       uid: data['uid'],
//                     //     ),
//                     //   ),
//                     // ),
//                     title: Text(username),
//                     leading: CircleAvatar(
//                       backgroundImage: NetworkImage(profilePic),
//                     ),
//                     subtitle: Text(name),
//                   );
//                 })
//               ],
//             );

//             // return ListView(
//             //   children: snapshot.data!.docs.wheremap((DocumentSnapshot document) {
//             //     return ListTile(
//             //       title: Text(document.data()!['username']),
//             //       subtitle: Text(document.data()!['email']),
//             //     );
//             //   }).toList(),
//             // );
//           }
//         });
//   }
// }
}
