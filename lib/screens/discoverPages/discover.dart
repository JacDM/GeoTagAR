// ignore_for_file: avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/screens/discoverPages/group_page.dart';
import 'package:geotagar/screens/userAccountScreens/user_profile.dart';

import '../../utils/text_field.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection('users');
  final TextEditingController _searchTextController = TextEditingController();
  bool showUsers = false;
  List<bool> selectedGroups = [];

  @override
  void initState() {
    super.initState();
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: const Text(
                'Discover',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: ReusableTextField(
                      controller: _searchTextController,
                      hintText: 'Search',
                      onChanged: (text) => _updateClearIconAndDisplay(),
                      keyboardType: TextInputType.text,
                      obscure: false,
                      suffix: _searchTextController.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear),
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
            SizedBox(height: 16),
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
                                  title: Text(username),
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(profilePic),
                                  ),
                                  subtitle: Text(name),
                                );
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
                        return ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          itemCount: (snapshot.data! as dynamic).docs.length,
                          itemBuilder: (context, index) {
                            bool isSelected = selectedGroups.length > index
                                ? selectedGroups[index]
                                : false;
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => GroupPage()));
                              },
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

                                    // Try fixing the length of the rectangle box and the circle icon which is exceeding its limits
                                    // Additionally, add the description
                                    child: Container(
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              (snapshot.data! as dynamic)
                                                  .docs[index]['avatar'],
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
                                                      .docs[index]['name'],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  (snapshot.data! as dynamic)
                                                          .docs[index]
                                                      ['description'],
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
                                  ),
                                  Positioned(
                                    top: 28,
                                    right: 20,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isSelected = !isSelected;
                                          if (selectedGroups.length <= index) {
                                            selectedGroups.add(isSelected);
                                          } else {
                                            selectedGroups[index] = isSelected;
                                          }
                                        });
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
