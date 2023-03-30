import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geotagar/models/posts.dart';
import 'package:geotagar/services/storage.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
      String description,
      Uint8List file,
      String uid,
      String username,
      String profImage,
      double lat,
      double long,
      String postId) async {
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);
      //String postId = const Uuid().v1(); // creates unique id based on time
      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        likes: [],
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
        location: GeoPoint(lat, long), locked: false,
      );
      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> likePost(String postId, String uid, List likes) async {
    String res = "Some error occurred";
    try {
      if (likes.contains(uid)) {
        // if the likes list contains the user uid, we need to remove it
        _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        // else we need to add uid to the likes array
        _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Post comment
  Future<String> postComment(String postId, String text, String uid,
      String name, String profilePic) async {
    String res = "Some error occurred";
    try {
      if (text.isNotEmpty) {
        // if the likes list contains the user uid, we need to remove it
        String commentId = const Uuid().v1();
        _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePic': profilePic,
          'name': name,
          'uid': uid,
          'text': text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
        });
        res = 'success';
      } else {
        res = "Please enter text";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Delete Post
  Future<String> deletePost(String postId) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('posts').doc(postId).delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> followUser(String uid, String followId) async {
    try {
      DocumentSnapshot snap =
          await _firestore.collection('users').doc(uid).get();
      List following = (snap.data()! as dynamic)['following'];

      if (following.contains(followId)) {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayRemove([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayRemove([followId])
        });
      } else {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayUnion([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> uploadImageToFirebaseStorage(File image, String path) async {
    try {
      Reference storageRef = FirebaseStorage.instance.ref().child(path);
      UploadTask uploadTask = storageRef.putFile(image);
      await uploadTask.whenComplete(() {});
      String downloadUrl = await storageRef.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print(e.toString());
      return '';
    }
  }

  Future<void> updateUserProfile({
    required String uid,
    required String name,
    required String bio,
    required String profilePictureUrl,
    required String bannerUrl,
    required String accountType,
    required String gender,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'name': name,
        'bio': bio,
        'profilePic': profilePictureUrl,
        'banner': bannerUrl,
        'accountType': accountType,
        'gender': gender,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> reportPost(String postId, String postUrl, String uid,
      List<String> selectedReasons, String? comment) async {
    String res = "Some error occurred";
    try {
      DocumentSnapshot postSnap =
          await _firestore.collection('posts').doc(postId).get();
      if (postSnap.exists) {
        _firestore.collection('reportedPosts').add({
          'postId': postId,
          'postUrl': postUrl,
          'reporterId': uid,
          'reportDate': DateTime.now(),
          'reasons': selectedReasons.toString(),
          'comment': comment,
        });
        res = 'Success';
      } else {
        res = "Post not found";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> removeFromReportedPosts(String postId) async {
    try {
      await _firestore.collection('reportedPosts').doc(postId).delete();
    } catch (e) {
      print('Error while removing post from reportedPosts: $e');
    }
  }
}
