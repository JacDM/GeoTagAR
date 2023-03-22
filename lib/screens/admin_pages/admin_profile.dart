import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/core/constants/constants.dart';
import '../../services/firestore.dart';
import '../../utils/follow_button.dart';
import '../../utils/methods.dart';

class AdminProfile extends StatefulWidget {
  final String uid;
  const AdminProfile({super.key, required this.uid});

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  late Map<String, dynamic> userData;

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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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

                //Edit Profile Button  (not inserted yet)

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
                  length: 3,
                  child: Column(
                    children: [
                      const TabBar(
                        indicatorColor: Colors.blue,
                        labelColor: Colors.white, // Added
                        tabs: [
                          Tab(text: 'Posts'),
                          Tab(text: 'Scrapbooks'),
                          Tab(text: 'Tags'),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
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
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: scrapbooks.length * 2 - 1,
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
                                                scrapbooks[index]['posts']);

                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                  scrapbooks[index]['name']),
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
                                                  child: Text('Close'),
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
                            Container(
                              child: const Center(
                                child: Text(
                                  "Tags functionality not implemented yet.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
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
