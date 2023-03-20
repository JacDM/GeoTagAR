import 'package:cloud_firestore/cloud_firestore.dart';
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
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: width > 600 ? Pallete.whiteColor : Pallete.blackColor,
      appBar: width > 600
          ? null
          : AppBar(
              backgroundColor: Pallete.blackColor,
              automaticallyImplyLeading: false,
              centerTitle: true,
              toolbarHeight: 90,
              title: const Text(
                        'THE FEED',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      ),
              // actions: [
              //   IconButton(
              //     icon: const Icon(
              //       Icons.chat_bubble_outline_rounded,
              //       color: Pallete.whiteColor,
              //     ),
              //     onPressed: () {},
              //   ),
              // ],
            ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
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

              child: Stack (
                children: [
                  Container(
                    margin:
                    const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade200,
                    ),

                    // Try fixing the length of the rectangle box and the circle icon which is exceeding its limits
                    child: PostCard(
                      snap: snapshot.data!.docs[index].data(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
