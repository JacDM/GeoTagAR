import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

import '../../models/groups.dart';

class GroupServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  CollectionReference get _groups => _firestore.collection('groups');

  Future<String> uploadImage(
      File imageFile, String groupId, bool isAvatar) async {
    String fileName = path.basename(imageFile.path);
    String fileExtension = path.extension(imageFile.path);
    String filePath = isAvatar ? 'group_avatars' : 'group_banners';

    Reference ref = _storage.ref().child('$filePath/$groupId/$fileName');
    UploadTask uploadTask = ref.putFile(imageFile);

    await uploadTask.whenComplete(() async {
      print('File uploaded');
    }).catchError((error) {
      print('Error uploading file: $error');
      throw Exception('Failed to upload file');
    });

    String downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }

  // Add the following methods to GroupServices
  Future<void> addUserToGroup(String groupId, String userId) async {
    await _groups.doc(groupId).update({
      'members': FieldValue.arrayUnion([userId]),
    });
  }

  Future<void> removeUserFromGroup(String groupId, String userId) async {
    await _groups.doc(groupId).update({
      'members': FieldValue.arrayRemove([userId]),
    });
  }

  Future<bool> isUserInGroup(String groupId, String userId) async {
    final DocumentSnapshot groupSnapshot = await FirebaseFirestore.instance
        .collection('groups')
        .doc(groupId)
        .get();
    final List<dynamic> members = groupSnapshot.get('members');

    return members.contains(userId);
  }

  Future<Community> createGroup({
    required String groupName,
    required String groupDescription,
    required File groupAvatar,
    required File groupBanner,
    required List<String> moderators,
  }) async {
    User currentUser = _auth.currentUser!;
    String groupId = _firestore.collection('groups').doc().id;

    String groupAvatarURL = await uploadImage(groupAvatar, groupId, true);
    String groupBannerURL = await uploadImage(groupBanner, groupId, false);

    Community newGroup = Community(
      groupId: groupId,
      groupName: groupName,
      groupDescription: groupDescription,
      groupBanner: groupBannerURL,
      groupPicture: groupAvatarURL,
      members: [currentUser.uid],
      mods: moderators,
    );

    await _groups.doc(groupId).set(newGroup.toMap());
    return newGroup;
  }
}
