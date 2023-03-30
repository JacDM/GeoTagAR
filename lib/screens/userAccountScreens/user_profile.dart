import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/core/constants/constants.dart';
import '../../services/firestore.dart';
import '../../utils/follow_button.dart';
import '../../utils/methods.dart';
import 'UserSettings/edit_profile.dart';

class UserProfile extends StatefulWidget {
  final String uid;
  const UserProfile({super.key, required this.uid});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late Map<String, dynamic> userData;
  final TextEditingController _scrapbookNameController =
      TextEditingController();

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
          .where('uid', isEqualTo: widget.uid)
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

  Future<void> addScrapbook(String scrapbookName) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .collection('scrapbooks')
        .add({'name': scrapbookName, 'posts': []});
  }

  Future<void> addPostToScrapbook(String scrapbookId, String postId) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .collection('scrapbooks')
        .doc(scrapbookId)
        .update({
      'posts': FieldValue.arrayUnion([postId])
    });
  }

  void _showScrapbookCreationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create a new scrapbook',
              style: TextStyle(color: Colors.white)),
          content: TextField(
            controller: _scrapbookNameController,
            decoration: InputDecoration(
              hintText: 'Enter scrapbook name',
              hintStyle: TextStyle(color: Colors.white70),
            ),
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF121212),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                addScrapbook(_scrapbookNameController.text.trim());
                _scrapbookNameController.clear();
                Navigator.pop(context);
              },
              child: Text(
                'Create',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  // Add this function to create the scrapbook selection dialog
  void _showScrapbookSelectionDialog(String postId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(widget.uid)
              .collection('scrapbooks')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            List<DocumentSnapshot> scrapbooks = snapshot.data!.docs;

            return AlertDialog(
              title: const Text(
                'Select a scrapbook',
                style: TextStyle(color: Colors.white),
              ),
              content: Container(
                width: double.maxFinite,
                child: ListView.builder(
                  itemCount: scrapbooks.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        scrapbooks[index]['name'],
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        addPostToScrapbook(scrapbooks[index].id, postId);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
              backgroundColor: Color(0xFF121212),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final UserModel user = Provider.of<UserProvider>(context).getUser;

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
        // backgroundColor: Colors.blueGrey[200],
        backgroundColor: Colors.black, // Added
        appBar: AppBar(
          title: Text(userData['username']),
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //header - profile pic, background pic and settings button
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Background Picture
                    Container(
                      height: MediaQuery.of(context).size.height *
                          0.3, // set the height of the banner here
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(userData['banner']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Settings
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

                    // Profile Picture
                    Positioned(
                      bottom: -55.0,
                      right: MediaQuery.of(context).size.width * 0.35,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.15,
                        backgroundColor: Colors.white38,
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.14,
                          backgroundImage: NetworkImage(userData['profilePic']),
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
                // Text(
                //   userData['username'],
                //   style: const TextStyle(
                //     fontSize: 30.0,
                //     fontFamily: 'arial',
                //     fontWeight: FontWeight.w900,
                //   ),
                //   textAlign: TextAlign.center,
                // ),

                //Username
                Text(
                  userData['name'],
                  style: const TextStyle(
                    color: Colors.white, // Added
                    fontSize: 17.0,
                    //fontFamily: 'FiraCode',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                //Bio/description

                if (userData['bio'] != null &&
                    userData['bio'].toString().trim().isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      tileColor: Colors.black, // Added
                      title: Text(
                        userData['bio'],
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white, // Added
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
                        style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        followers.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        following.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
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
                          color: Colors.white, // Added
                        ),
                      ),
                      Text(
                        'Followers',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Added
                        ),
                      ),
                      Text(
                        'Following',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Added
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
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfile(
                                      userData:
                                          userData.cast<String, dynamic>()),
                                ),
                              );
                            },
                            child: const Text('Edit Profile'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
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
                              ),
                    FirebaseAuth.instance.currentUser!.uid == widget.uid
                        ? ElevatedButton(
                            onPressed: _showScrapbookCreationDialog,
                            child: const Text('Create scrapbook'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),

                // SizedBox(
                //   width: MediaQuery.of(context).size.width - 20,
                //   child: const Divider(
                //     color: Colors.grey, // Added
                //     height: 20.0,
                //     thickness: 1.0,
                //   ),
                // ),
                // const Divider(color: Colors.grey), // Added
                // const Divider(),
                const SizedBox(
                  height: 10.0,
                ),
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(
                        indicatorColor: Colors.blue,
                        labelColor: Colors.white, // Added
                        tabs: [
                          Tab(text: 'Posts'),
                          Tab(text: 'Scrapbooks'),
                          //Tab(text: 'Tags'),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 1.2,
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 0.0, 10.0, 20.0),
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
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: (snapshot.data! as dynamic)
                                          .docs
                                          .length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 1.5,
                                        childAspectRatio: 1,
                                      ),
                                      itemBuilder: (context, index) {
                                        DocumentSnapshot snap =
                                            (snapshot.data! as dynamic)
                                                .docs[index];

                                        return GestureDetector(
                                          onLongPress: () {
                                            if (FirebaseAuth.instance
                                                    .currentUser!.uid ==
                                                widget.uid) {
                                              _showScrapbookSelectionDialog(
                                                  snap.id);
                                            }
                                          },
                                          child: Container(
                                            child: Image(
                                              image:
                                                  NetworkImage(snap['postUrl']),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }),
                            ),
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(widget.uid)
                                  .collection('scrapbooks')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }

                                List<DocumentSnapshot> scrapbooks =
                                    snapshot.data!.docs;

                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount: scrapbooks.isNotEmpty
                                      ? scrapbooks.length * 2 - 1
                                      : 0,
                                  itemBuilder: (context, index) {
                                    if (index.isOdd) {
                                      // Add a divider between the list tiles
                                      return const Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: Color.fromARGB(255, 44, 44, 44),
                                      );
                                    }
                                    final int scrapbookIndex = index ~/ 2;
                                    return ListTile(
                                      title: Text(
                                        scrapbooks[scrapbookIndex]['name'],
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                      onTap: () async {
                                        List<String> postIds =
                                            List<String>.from(
                                                scrapbooks[scrapbookIndex]
                                                    ['posts']);

                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                  scrapbooks[scrapbookIndex]
                                                      ['name']),
                                              content: Container(
                                                width: double.maxFinite,
                                                child: FutureBuilder<
                                                    List<DocumentSnapshot>>(
                                                  future: FirebaseFirestore
                                                      .instance
                                                      .collection('posts')
                                                      .where(
                                                          FieldPath.documentId,
                                                          whereIn: postIds)
                                                      .get()
                                                      .then((snapshot) =>
                                                          snapshot.docs),
                                                  builder: (context, snapshot) {
                                                    if (!snapshot.hasData) {
                                                      return const CircularProgressIndicator();
                                                    }

                                                    List<DocumentSnapshot>
                                                        posts = snapshot.data!;

                                                    return GridView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: posts.length,
                                                      gridDelegate:
                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        crossAxisSpacing: 5,
                                                        mainAxisSpacing: 1.5,
                                                        childAspectRatio: 1,
                                                      ),
                                                      itemBuilder:
                                                          (context, postIndex) {
                                                        return Container(
                                                          child: Image(
                                                            image: NetworkImage(
                                                                posts[postIndex]
                                                                    [
                                                                    'postUrl']),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: const Text('Close'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                            // Container(
                            //   child: const Center(
                            //     child: Text(
                            //       "Tags functionality not implemented yet.",
                            //       style: TextStyle(
                            //         fontSize: 16,
                            //         color: Colors.grey,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //Pictures
              ],
            ),
          ),
        ),
      );
    }
  }
}
