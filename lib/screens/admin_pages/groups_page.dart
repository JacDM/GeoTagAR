import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:geotagar/screens/discoverpages/group_page.dart';
import 'package:geotagar/screens/discoverpages/create_group.dart';

import '../../core/constants/constants.dart';
import '../../utils/colors.dart';
import '../../utils/text_field.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  final CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection('groups');
  // Update this to search for groups
  final TextEditingController _searchTextController = TextEditingController();
  bool searchGroups = false;
  List<bool> selectedGroups = [];

  @override
  void initState() {
    super.initState();
    //fetchUsers();
    _searchTextController.addListener(_updateClearIconAndDisplay);
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  void _updateClearIconAndDisplay() {
    setState(() {
      searchGroups = _searchTextController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
                    const Text(
                      'Discover',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "ABeeZee",
                      ),
                    ),
                  ],
                )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CreateGroupPage(),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: ReusableTextField(
                      controller: _searchTextController,
                      hintText: 'Search',
                      onChanged: (text) => _updateClearIconAndDisplay(),
                      keyboardType: TextInputType.text,
                      obscure: false,
                      textColor: Colors.white,
                      suffix: _searchTextController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  _searchTextController.clear();
                                  _updateClearIconAndDisplay();
                                });
                              },
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: searchGroups
                  ? StreamBuilder<QuerySnapshot>(
                      stream: _firebaseFirestore.snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          final filteredGroups = snapshot.data!.docs
                              .where((QueryDocumentSnapshot<Object?> element) {
                            final data = element.data() as Map<String, dynamic>;
                            if (!data.containsKey('groupName') ||
                                !data.containsKey('groupPicture') ||
                                !data.containsKey('groupId')) {
                              return false;
                            }
                            return data['groupName']
                                .toString()
                                .toLowerCase()
                                .contains(_searchTextController.text
                                    .trim()
                                    .toLowerCase());
                          }).toList();
                          if (filteredGroups.isEmpty) {
                            return const Center(
                                child: Text('No groups found.'));
                          } else {
                            return ListView(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              children: filteredGroups
                                  .map((QueryDocumentSnapshot<Object?> data) {
                                final String name = data.get('groupName');
                                final String groupPicture =
                                    data['groupPicture'];
                                //final String name = data['name'];

                                return ListTile(
                                    onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => GroupPage(
                                              groupId: data['groupId'],
                                            ),
                                          ),
                                        ),
                                    title: Text(
                                      name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(groupPicture),
                                    ),
                                    subtitle: Text(
                                      name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ));
                              }).toList(),
                            );
                          }
                        }
                      })
                  : FutureBuilder(
                      // Test group created in firebase
                      future:
                          FirebaseFirestore.instance.collection('groups').get(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        // // Initialize the selectedGroups list
                        // (snapshot.data! as dynamic).docs.forEach((doc) async {
                        //   String groupId = doc.id;
                        //   String currentUserId =
                        //       FirebaseAuth.instance.currentUser!.uid;
                        //   bool isMember = await _groupServices.isUserInGroup(
                        //       groupId, currentUserId);
                        //   selectedGroups.add(isMember);
                        // });
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          itemCount: (snapshot.data! as dynamic).docs.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => GroupPage(
                                      groupId: (snapshot.data! as dynamic)
                                          .docs[index]
                                          .id,
                                    ),
                                  ),
                                );
                              },
                              child: Stack(
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
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            (snapshot.data! as dynamic)
                                                .docs[index]['groupPicture'],
                                            height: 48,
                                            width: 48,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                (snapshot.data! as dynamic)
                                                    .docs[index]['groupName'],
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                (snapshot.data! as dynamic)
                                                        .docs[index]
                                                    ['groupDescription'],
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
