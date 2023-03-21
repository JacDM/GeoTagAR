import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatefulWidget {
  final String groupId;

  const GroupPage({Key? key, required this.groupId}) : super(key: key);

  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  late Future<DocumentSnapshot> _groupFuture;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _groupFuture = FirebaseFirestore.instance
        .collection('groups')
        .doc(widget.groupId)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: _groupFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        Map<String, dynamic> groupData =
            snapshot.data!.data() as Map<String, dynamic>;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              groupData['groupName'],
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  _isFavorite ? Icons.check : Icons.add,
                  color: _isFavorite ? Colors.green : Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                },
              ),
            ],
          ),
          body: Container(
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    //Background Picture
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(groupData['groupBanner']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //Settings
                    // Positioned(
                    //   top: 10.0,
                    //   right: 10.0,
                    //   child: CircleAvatar(
                    //     backgroundColor: Colors.black,
                    //     //22.0
                    //     radius: MediaQuery.of(context).size.width * 0.0525,
                    //     child: GestureDetector(
                    //       onTap: () {
                    //         Navigator.pushNamed(context, '/settings');
                    //       },
                    //       child: Icon(
                    //         Icons.settings,
                    //         //35.0
                    //         size: MediaQuery.of(context).size.width * 0.08,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    //Profile Picture
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.155,
                      left: 16,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.15,
                        backgroundColor: Colors.white38,
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                              width: 2,
                            ),
                            image: DecorationImage(
                              image: NetworkImage(groupData['groupPicture']),
                              fit: BoxFit.cover,
                            ),
                            // NetworkImage(groupData['profilePic']),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                // Stack(
                //   children: [
                //     Container(
                //       height: MediaQuery.of(context).size.height * 0.25,
                //       width: double.infinity,
                //       decoration: BoxDecoration(
                //         image: DecorationImage(
                //           image: NetworkImage(groupData['groupBanner']),
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //     ),
                //     Positioned(
                //       top: MediaQuery.of(context).size.height * 0.10,
                //       left: 16,
                //       child: Container(
                //         height: MediaQuery.of(context).size.width * 0.3,
                //         width: MediaQuery.of(context).size.width * 0.3,
                //         decoration: BoxDecoration(
                //           shape: BoxShape.rectangle,
                //           borderRadius: BorderRadius.circular(8),
                //           border: Border.all(
                //             color: Colors.white.withOpacity(0.5),
                //             width: 2,
                //           ),
                //           image: DecorationImage(
                //             image: NetworkImage(groupData['groupPicture']),
                //             fit: BoxFit.cover,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.4,
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: Text(
                    '${(groupData['members'] as List<dynamic>).length} Members',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: const Text(
                    'About Group',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.01,
                      bottom: MediaQuery.of(context).size.height * 0.02),
                  child: Text(
                    groupData['groupDescription'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        const TabBar(
                          labelColor: Colors.white,
                          indicatorColor: Colors.green,
                          tabs: [
                            Tab(
                              text: 'Challenges',
                            ),
                            Tab(
                              text: 'Explore',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Container(),
                              Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
