import 'package:flutter/material.dart';

class User {
    final String email;
    final String uid;
    final String password;
    final Strign photoUrl;
    final String username;
    final String bio;
    final String gender;
    final String age;
    // final String followers;
    // final String following;
    // final String posts;

    const User({
        required this.email,
        required this.uid,
        required this.password,
        required this.photoUrl,
        required this.username,
        required this.bio,
        required this.gender,
        required this.age,
        // required this.followers,
        // required this.following,
        // required this.posts,
    });

    Map<String, dynamic> toJson() => {
        "username" : username,
        "password" : password,
        "uid" : uid,
        "email" : email,
        "photoUrl" : photoUrl,
        "bio" : bio,
        "gender" : gender,
        "age" : age,
        // "followers" : followers,
        // "following" : following,
        // "posts" : posts,
    };


    static User fromSnap(DocumentSnapshot snap) {
        var snapshot = snap.data() as Map <String, dynamic>;
        return User(
            username : snapshot['username'],
            password : snapshot['password'],
            uid : snapshot['uid'],
            email : snapshot['email'],
            photoUrl : snapshot['photoUrl'],
            bio : snapshot['bio'],
            gender : snapshot['gender'],
            age : snapshot['age'],
        );
    }


}

//Add this in Register.dart -> add user to database
// import this file as models;

// models.User user = models.User(
//     username : username,
//     password : password,
//     uid : cred.user!.uid,
//     email : email,
//     photoUrl : photoUrl,
//     bio : bio,
//     gender : gender,
//     age : age,
// );

// await FirebaseFirestore.instance.collection('users').doc(cred.user!.uid).set(user.toJson(),);
