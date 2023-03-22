import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geotagar/utils/colors.dart';
import 'package:geotagar/utils/global_variables.dart';
import 'package:geotagar/utils/post_card.dart';
import 'package:geotagar/core/constants/constants.dart';

import '../utils/methods.dart';

class Feed extends StatefulWidget {
  final String uid;
  const Feed({Key? key, required this.uid}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  late Map<String, dynamic> userData;
  bool isLoading = false;

  String capitalize(string) {
    return "${string[0].toUpperCase()}${string.substring(1).toLowerCase()}";
  }

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
      userData = userSnap.data()!;
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

  Future<List<String>> _getFollowingList() async {
    DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return List<String>.from(userDoc.data()!['following']);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
        backgroundColor: width > 600 ? Pallete.whiteColor : Pallete.blackColor,
        appBar: width > 600
            ? null
            : AppBar(
                backgroundColor: Color.fromARGB(255, 29, 29, 29),
                automaticallyImplyLeading: false,
                centerTitle: true,
                toolbarHeight: 90,
                title: Row(
                  children: [
                    Image.asset(
                      Constants.logoPathBlack,
                      height: 100.0,
                      width: 100.0,
                    ),
                    Text(
                      'Hi ' + capitalize(userData["name"]) + '!',
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "ABeeZee",
                      ),
                    ),
                  ],
                )),
        body: FutureBuilder<List<String>>(
          future: _getFollowingList(),
          builder: (context, followingSnapshot) {
            if (!followingSnapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final List<String> followingList = followingSnapshot.data!;
            if (followingList.isEmpty) {
              // show a message or return a Widget that tells the user to follow some users
              return Center(
                child: Text(
                  'Follow some users by visiting the discover page',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            } else {
              return StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('posts')
                    .where('uid', whereIn: [
                  FirebaseAuth.instance.currentUser!.uid,
                  ...followingList
                ])
//.orderBy('datePublished', descending: true)
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (ctx, index) => Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: width > 600 ? width * 0.3 : 0,
                          vertical: width > 600 ? 15 : 0,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey.shade200,
                              ),
                              child: PostCard(
                                snap: snapshot.data!.docs[index].data(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              );
            }
          },
        ),
      );
    }
  }
}
