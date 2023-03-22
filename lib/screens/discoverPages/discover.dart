import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/screens/discoverPages/group_page.dart';
import 'package:geotagar/screens/discoverPages/create_group.dart';
import 'package:geotagar/screens/userAccountScreens/user_profile.dart';
import '../../core/constants/constants.dart';
import '../../utils/colors.dart';
import '../../utils/text_field.dart';
import 'group_services.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection('users');
  final GroupServices _groupServices = GroupServices();
  final TextEditingController _searchTextController = TextEditingController();
  bool showUsers = false;
  //List<bool> selectedGroups = [];
  Map<String, bool> selectedGroups = {};

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

  void _onSearchTextChanged(String text) {
    setState(() {
      showUsers = text.isNotEmpty;
    });
  }

  void _updateClearIconAndDisplay() {
    setState(() {
      showUsers = _searchTextController.text.isNotEmpty;
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
                    // Image.asset(
                    //   Constants.logoPathBlack,
                    //   height: 100.0,
                    //   width: 100.0,
                    // ),
                    const Text(
                      'Discover',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "ABeeZee",
                      ),
                    ),
                  ],
                )
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
              child: showUsers
                  ? StreamBuilder<QuerySnapshot>(
                      stream: _firebaseFirestore.snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          final filteredUsers = snapshot.data!.docs
                              .where((QueryDocumentSnapshot<Object?> element) {
                            final data = element.data() as Map<String, dynamic>;
                            if (!data.containsKey('username') ||
                                !data.containsKey('profilePic') ||
                                !data.containsKey('name') ||
                                !data.containsKey('uid')) {
                              return false;
                            }
                            return data['username']
                                .toString()
                                .toLowerCase()
                                .contains(_searchTextController.text
                                    .trim()
                                    .toLowerCase());
                          }).toList();
                          if (filteredUsers.isEmpty) {
                            return const Center(child: Text('No users found.'));
                          } else {
                            return ListView(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              children: filteredUsers
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
                                    title: Text(
                                      username,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(profilePic),
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
                      future:
                          FirebaseFirestore.instance.collection('groups').get(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (selectedGroups.isEmpty) {
                          (snapshot.data! as dynamic).docs.forEach((doc) async {
                            String groupId = doc.id;
                            String currentUserId =
                                FirebaseAuth.instance.currentUser!.uid;
                            bool isMember = await _groupServices.isUserInGroup(
                                groupId, currentUserId);
                            selectedGroups[groupId] = isMember;
                          });
                        }
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          itemCount: (snapshot.data! as dynamic).docs.length,
                          itemBuilder: (context, index) {
                            String groupId =
                                (snapshot.data! as dynamic).docs[index].id;
                            bool isSelected =
                                selectedGroups.containsKey(groupId)
                                    ? selectedGroups[groupId]!
                                    : false;

                            print(index);
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => GroupPage(
                                      groupId: groupId,
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
                                  Positioned(
                                    top: 28,
                                    right: 20,
                                    child: InkWell(
                                      onTap: () async {
                                        String currentUserId = FirebaseAuth
                                            .instance.currentUser!.uid;
                                        bool isMember =
                                            await _groupServices.isUserInGroup(
                                                groupId, currentUserId);

                                        if (isMember) {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: const Text('Leave group?'),
                                              content: const Text(
                                                  'Are you sure you want to leave this group?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('No'),
                                                ),
                                                TextButton(
                                                  onPressed: () async {
                                                    await _groupServices
                                                        .removeUserFromGroup(
                                                            groupId,
                                                            currentUserId);
                                                    setState(() {
                                                      selectedGroups[groupId] =
                                                          false;
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Yes'),
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          await _groupServices.addUserToGroup(
                                              groupId, currentUserId);
                                          setState(() {
                                            selectedGroups[groupId] = true;
                                          });
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isSelected
                                              ? Colors.green
                                              : Colors.blue,
                                        ),
                                        child: Icon(
                                          isSelected ? Icons.check : Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
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
