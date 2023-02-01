// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/core/constants/constants.dart';
import 'package:geotagar/layout/mobile_layout.dart';
import 'package:geotagar/screens/userAccountScreens/UserSettings/user_settings.dart';
import 'package:geotagar/screens/userAccountScreens/post_page.dart';
import 'package:provider/provider.dart';
import 'package:geotagar/models/users.dart' as model;
import '../../models/users.dart';
import '../../providers/user_provider.dart';
import '../../services/auth.dart';
import '../../services/firestore.dart';
import '../../utils/follow_button.dart';
import '../../utils/methods.dart';
import '../userLogIn_Register/log_in.dart';

class UserProfile extends StatefulWidget {
  final String uid;
  const UserProfile({super.key, required this.uid});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var userData = {};
  int postLen = 0;
  int followers = 0;
  int following = 0;
  bool isFollowing = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();

      // get post lENGTH
      var postSnap = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      postLen = postSnap.docs.length;
      userData = userSnap.data()!;
      followers = userSnap.data()!['followers'].length;
      following = userSnap.data()!['following'].length;
      isFollowing = userSnap
          .data()!['followers']
          .contains(FirebaseAuth.instance.currentUser!.uid);
      setState(() {});
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final UserModel user = Provider.of<UserProvider>(context).getUser;
    if (isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          CircularProgressIndicator(
            value: 0.3,
            color: Colors.greenAccent,
          ),
        ],
      );
    } else {
      return Scaffold(
        //backgroundColor: Colors.blueGrey[200],

        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //header - profile pic, background pic and settings button
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    //Background Picture
                    const Image(
                      image: NetworkImage(Constants.bannerDefault),
                    ),

                    //Settings
                    Positioned(
                      top: 10.0,
                      right: 10.0,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        //22.0
                        radius: MediaQuery.of(context).size.width * 0.0525,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/settings');
                          },
                          child: Icon(
                            Icons.settings,
                            //35.0
                            size: MediaQuery.of(context).size.width * 0.08,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    //Profile Picture
                    Positioned(
                      bottom: -55.0,
                      right: MediaQuery.of(context).size.width * 0.35,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.15,
                        backgroundColor: Colors.white38,
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.14,
                          backgroundImage:
                              const NetworkImage(Constants.avatarDefault),
                        ),
                      ),
                    ),
                  ],
                ),

                //Spacing
                const SizedBox(
                  height: 60.0,
                ),

                //Name
                Text(
                  userData['username'],
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'arial',
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),

                //Username
                Text(
                  userData['name'],
                  style: const TextStyle(
                    fontSize: 17.0,
                    //fontFamily: 'FiraCode',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                //Bio/description (List)
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text(
                      'Bio Goes here',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                //Moments, Followers, Following (Row)

                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        postLen.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        followers.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        following.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const <Widget>[
                      Text(
                        'Moments',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Followers',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Following',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                //Edit Profile Button  (not inserted yet)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FirebaseAuth.instance.currentUser!.uid == widget.uid
                        ? FollowButton(
                            text: 'Edit Profile',
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            borderColor: Colors.grey,
                          )
                        : isFollowing
                            ? FollowButton(
                                text: 'Unfollow',
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                                borderColor: Colors.grey,
                                function: () async {
                                  await FireStoreMethods().followUser(
                                    FirebaseAuth.instance.currentUser!.uid,
                                    userData['uid'],
                                  );

                                  setState(() {
                                    isFollowing = false;
                                    followers--;
                                  });
                                },
                              )
                            : FollowButton(
                                text: 'Follow',
                                backgroundColor: Colors.blue,
                                textColor: Colors.white,
                                borderColor: Colors.blue,
                                function: () async {
                                  await FireStoreMethods().followUser(
                                    FirebaseAuth.instance.currentUser!.uid,
                                    userData['uid'],
                                  );

                                  setState(() {
                                    isFollowing = true;
                                    followers++;
                                  });
                                },
                              )
                  ],
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Divider(
                    color: Colors.black,
                    height: 20.0,
                    thickness: 1.0,
                  ),
                ),

                //Scrapbook, Tags (Row)
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       TextButton(
                //         style: TextButton.styleFrom(
                //           shape: RoundedRectangleBorder(
                //             side: BorderSide(
                //               color: Colors.blueGrey,
                //               width: pressedMemoriesTab ? 3 : 1,
                //               style: BorderStyle.solid,
                //             ),
                //             borderRadius: const BorderRadius.all(
                //               Radius.circular(5.0),
                //             ),
                //           ),
                //         ),
                //         onPressed: () {
                //           setState(() {
                //             pressedMemoriesTab = true;
                //             pressedTagsTab = false;
                //           });
                //         },
                //         child: Column(
                //           children: [
                //             Icon(
                //               Icons.image_outlined,
                //               size: 40.0,
                //               color: Colors.teal[900],
                //             ),
                //             Text(
                //               'Memories and Scrapbooks',
                //               style: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 15.0,
                //                 color: Colors.teal[900],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       TextButton(
                //         style: TextButton.styleFrom(
                //           shape: RoundedRectangleBorder(
                //             side: BorderSide(
                //               color: Colors.blueGrey,
                //               width: pressedTagsTab ? 3 : 1,
                //               style: BorderStyle.solid,
                //             ),
                //             borderRadius:
                //                 const BorderRadius.all(Radius.circular(5.0)),
                //           ),
                //         ),
                //         onPressed: () {
                //           setState(() {
                //             pressedMemoriesTab = false;
                //             pressedTagsTab = true;
                //           });
                //         },
                //         child: Column(
                //           children: [
                //             Icon(
                //               Icons.people_alt_outlined,
                //               size: 35.0,
                //               color: Colors.teal[900],
                //             ),
                //             Text(
                //               'Tags',
                //               style: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 15.0,
                //                 color: Colors.teal[900],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
                  child: FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('posts')
                          .where('uid', isEqualTo: widget.uid)
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: (snapshot.data! as dynamic).docs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 1.5,
                            childAspectRatio: 1,
                          ),
                          itemBuilder: (context, index) {
                            DocumentSnapshot snap =
                                (snapshot.data! as dynamic).docs[index];

                            return Container(
                              child: Image(
                                image: NetworkImage(snap['postUrl']),
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        );
                      }),
                ),

                //Pictures
              ],
            ),
          ),
        ),
      );
    }

    Column buildStatColumn(int num, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            num.toString(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      );
    }
  }
}
