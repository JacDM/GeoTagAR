import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geotagar/models/groups.dart';

import '../../utils/methods.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({super.key, this.group});

  final Community? group;
  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  var groupData = {};
  // int postLen = 0;
  int members = 0;
  // int following = 0;
  // bool isFollowing = false;
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
      var groupSnap =
          await FirebaseFirestore.instance.collection('groups').get();

      // // get post lENGTH
      // var postSnap = await FirebaseFirestore.instance
      //     .collection('posts')
      //     .where('uid', isEqualTo: widget.uid)
      //     .get();

      // postLen = postSnap.docs.length;
      groupData = groupSnap.docs[0].data();
      members = groupSnap.docs[0].get('members').length;
      // following = userSnap.data()!['following'].length;
      // isFollowing = userSnap
      //     .data()!['followers']
      //     .contains(FirebaseAuth.instance.currentUser!.uid);
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
        appBar: AppBar(
          title: const Text('Group Page'),
        ),
        // Shows number of members of the latest group i.e., needs to be updated
        body: Center(child: Text(members.toString())),
      );
    }
  }
}
