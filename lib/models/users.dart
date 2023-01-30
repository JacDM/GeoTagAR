// ignore_for_file: public_member_api_docs, sort_constructors_first
//import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserModel {
  final String email;
  final String uid;
  final String name;
  final String profilePicture;
  final String banner;

  final String username;

  final String gender;
  final String accountType;
  final List<String> awards;
  const UserModel({
    required this.email,
    required this.uid,
    required this.name,
    required this.profilePicture,
    required this.banner,
    required this.username,
    required this.gender,
    required this.accountType,
    required this.awards,
  });


  UserModel copyWith({
    String? email,
    String? uid,
    String? name,
    String? profilePicture,
    String? banner,
    String? username,
    String? gender,
    String? accountType,
    List<String>? awards,
  }) {
    return UserModel(
      email: email ?? this.email,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      profilePicture: profilePicture ?? this.profilePicture,
      banner: banner ?? this.banner,
      username: username ?? this.username,
      gender: gender ?? this.gender,
      accountType: accountType ?? this.accountType,
      awards: awards ?? this.awards,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'uid': uid,
      'name': name,
      'profilePicture': profilePicture,
      'banner': banner,
      'username': username,
      'gender': gender,
      'accountType': accountType,
      'awards': awards,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: (map["email"] ?? '') as String,
      uid: (map["uid"] ?? '') as String,
      name: (map["name"] ?? '') as String,
      profilePicture: (map["profilePicture"] ?? '') as String,
      banner: (map["banner"] ?? '') as String,
      username: (map["username"] ?? '') as String,
      gender: (map["gender"] ?? '') as String,
      accountType: (map["accountType"] ?? '') as String,
      awards: List<String>.from(((map['awards'] ?? const <String>[]) as List<String>),),
    );
  }

  @override
  String toString() {
    return 'UserModel(email: $email, uid: $uid, name: $name, profilePicture: $profilePicture, banner: $banner, username: $username, gender: $gender, accountType: $accountType, awards: $awards)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.uid == uid &&
      other.name == name &&
      other.profilePicture == profilePicture &&
      other.banner == banner &&
      other.username == username &&
      other.gender == gender &&
      other.accountType == accountType &&
      listEquals(other.awards, awards);
  }

  @override
  int get hashCode {
    return email.hashCode ^
      uid.hashCode ^
      name.hashCode ^
      profilePicture.hashCode ^
      banner.hashCode ^
      username.hashCode ^
      gender.hashCode ^
      accountType.hashCode ^
      awards.hashCode;
  }
}

