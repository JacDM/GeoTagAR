import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geotagar/utils/colors.dart';
import 'package:geotagar/utils/global_variables.dart';
import 'package:geotagar/utils/post_card.dart';
import 'package:geotagar/core/constants/constants.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
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
                    height: 200.0,
                    width: 200.0,
                  ),
                  const Text(
                    'FEED',
                    style: TextStyle(
                      fontSize: 34,
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
          return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('posts')
                .where('uid', whereIn: followingList)
                .snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
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
                        child: PostCard(
                          snap: snapshot.data!.docs[index].data(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
