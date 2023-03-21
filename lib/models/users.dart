// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  final String email;
  final String uid;
  final String profilePic;
  final String banner;
  final String username;
  final String name;
  final String bio;
  final int age;
  final String gender;
  final String accountType;
  final List followers;
  final List following;
  final List blockedUsers;
  final bool isAdmin;

  const UserModel(
      {required this.username,
      required this.uid,
      required this.profilePic,
      required this.email,
      required this.name,
      required this.bio,
      required this.age,
      required this.accountType,
      required this.banner,
      required this.gender,
      required this.followers,
      required this.following,
      required this.blockedUsers,
      required this.isAdmin});

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
        username: snapshot["username"],
        uid: snapshot["uid"],
        email: snapshot["email"],
        profilePic: snapshot["profilePic"],
        gender: snapshot['gender'],
        accountType: snapshot['accountType'],
        banner: snapshot['banner'],
        bio: snapshot["bio"],
        followers: snapshot["followers"],
        following: snapshot["following"],
        name: snapshot['name'],
        blockedUsers: snapshot['blockedUsers'],
        isAdmin: snapshot['isAdmin'],
        age: snapshot['age']);
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "name": name,
        "profilePic": profilePic,
        "bio": bio,
        "gender": gender,
        "banner": banner,
        "accountType": accountType,
        "followers": followers,
        "following": following,
        "blockedUsers": blockedUsers,
        "isAdmin": isAdmin,
        "age": age
      };

  ////////////////////////////////
  UserModel copyWith({
    String? email,
    String? uid,
    String? name,
    String? profilePic,
    String? banner,
    String? username,
    String? gender,
    String? bio,
    String? accountType,
    int? age,
    List<String>? followers,
    List<String>? following,
    List<String>? blockedUsers,
    bool? isAdmin,
  }) {
    return UserModel(
      email: email ?? this.email,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      banner: banner ?? this.banner,
      username: username ?? this.username,
      gender: gender ?? this.gender,
      accountType: accountType ?? this.accountType,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      bio: bio ?? this.bio,
      blockedUsers: blockedUsers ?? this.blockedUsers,
      isAdmin: isAdmin ?? this.isAdmin,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'uid': uid,
      'name': name,
      'profilePicture': profilePic,
      'banner': banner,
      'username': username,
      'gender': gender,
      'bio': bio,
      'accountType': accountType,
      'followers': followers,
      'following': following,
      'blockedUsers': blockedUsers,
      'isAdmin': isAdmin,
      'age': age,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: (map["email"] ?? '') as String,
      uid: (map["uid"] ?? '') as String,
      name: (map["name"] ?? '') as String,
      profilePic: (map["profilePicture"] ?? '') as String,
      banner: (map["banner"] ?? '') as String,
      username: (map["username"] ?? '') as String,
      gender: (map["gender"] ?? '') as String,
      accountType: (map["accountType"] ?? '') as String,
      followers: List<String>.from(
        ((map['followers'] ?? const <String>[]) as List<String>),
      ),
      following: List<String>.from(
        ((map['following'] ?? const <String>[]) as List<String>),
      ),
      bio: (map["bio"] ?? '') as String,
      blockedUsers: List<String>.from(
        ((map['blockedUsers'] ?? const <String>[]) as List<String>),
      ),
      isAdmin: (map["isAdmin"] ?? false) as bool,
      age: (map["age"] ?? 0) as int,
    );
  }

  // static UserModel fromSnap(DocumentSnapshot snap) {
  //   var snapshot = snap.data() as Map<String, dynamic>;

  //   return UserModel(
  //       username: snapshot["username"],
  //       uid: snapshot["uid"],
  //       email: snapshot["email"],
  //       profilePic: snapshot["profilePic"],
  //       //bio: snapshot["bio"],
  //       gender: snapshot["gender"],
  //       followers: snapshot["followers"],
  //       following: snapshot["following"],
  //       accountType: snapshot["accountType"],
  //       banner: snapshot["banner"],
  //       name: snapshot["name"]);
  // }

  // String toJson() => json.encode(toMap());

  // factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(email: $email, uid: $uid, name: $name, profilePicture: $profilePic, age: $age, banner: $banner, username: $username, bio: $bio, blockedUsers: $blockedUsers, isAdmin: $isAdmin, gender: $gender, accountType: $accountType, followers: $followers, following: $following)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.uid == uid &&
        other.name == name &&
        other.profilePic == profilePic &&
        other.banner == banner &&
        other.username == username &&
        other.gender == gender &&
        other.bio == bio &&
        other.accountType == accountType &&
        other.isAdmin == isAdmin &&
        other.age == age &&
        listEquals(other.blockedUsers, blockedUsers) &&
        listEquals(other.followers, followers) &&
        listEquals(other.following, following);
  }

  @override
  int get hashCode {
    return email.hashCode ^
        uid.hashCode ^
        name.hashCode ^
        profilePic.hashCode ^
        banner.hashCode ^
        bio.hashCode ^
        username.hashCode ^
        gender.hashCode ^
        accountType.hashCode ^
        followers.hashCode ^
        following.hashCode ^
        blockedUsers.hashCode ^
        age.hashCode ^
        isAdmin.hashCode;
  }
}
