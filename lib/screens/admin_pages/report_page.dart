import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../services/firestore.dart'; // Import the FireStoreMethods class from your provided code

class ReportedPostsPage extends StatefulWidget {
  final String uid;
  ReportedPostsPage({required this.uid});

  @override
  _ReportedPostsPageState createState() => _ReportedPostsPageState();
}

class _ReportedPostsPageState extends State<ReportedPostsPage> {
  final FireStoreMethods _firestoreMethods = FireStoreMethods();
  List<DocumentSnapshot> _reportedPosts = [];
  bool isAdmin = false;

  @override
  void initState() {
    super.initState();
    _fetchUserAdminStatus();
    _fetchReportedPosts();
  }

  Future<void> _fetchUserAdminStatus() async {
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      isAdmin = userDoc.data()?['isAdmin'] ?? false;
    });
  }

  Future<void> _fetchReportedPosts() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('reportedPosts').get();
    setState(() {
      _reportedPosts = querySnapshot.docs;
    });
  }

  Widget _buildReportedPost(DocumentSnapshot post) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Image.network(
            post['postUrl'],
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.grey.withOpacity(0.6),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Reasons: ${post['reasons']}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          if (isAdmin)
            Positioned(
              top: 8,
              right: 8,
              child: PopupMenuButton<String>(
                icon: Icon(Icons.more_vert, color: Colors.white),
                onSelected: (String result) async {
                  if (result == 'delete') {
                    await _firestoreMethods.deletePost(post['postId']);
                    await _firestoreMethods.removeFromReportedPosts(post.id);
                  } else if (result == 'mark_safe') {
                    await _firestoreMethods.removeFromReportedPosts(post.id);
                  }
                  _fetchReportedPosts();
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'delete',
                    child: Text('Delete Post'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'mark_safe',
                    child: Text('Mark as Safe'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'cancel',
                    child: Text('Cancel'),
                  ),
                ],
              ),
            )
          else // add this else statement for non-admin users
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      //backgroundColor: Colors.white,
                      title: Text("You do not have admin privileges",
                          style: TextStyle(color: Colors.black)),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
                child: Icon(Icons.info, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// appBar: AppBar(
// title: Text
// title: Text('Reported Posts'),
// ),
      body: isAdmin
          ? Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                itemCount: _reportedPosts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  childAspectRatio: 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return _buildReportedPost(_reportedPosts[index]);
                },
              ),
            )
          : Center(
              child: Text(
                "Insufficient privileges",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
    );
  }
}
