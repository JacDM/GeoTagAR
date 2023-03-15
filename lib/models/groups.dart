import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Community {
  final String groupId;
  final String groupName;
  final String groupBanner;
  final String groupPicture;
  final List<String> members;
  //final List<String> mods;
  Community({
    required this.groupId,
    required this.groupName,
    required this.groupBanner,
    required this.groupPicture,
    required this.members,
    //required this.mods,
  });

  static Community fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Community(
        groupId: snapshot["groupId"],
        groupName: snapshot["groupName"],
        groupBanner: snapshot["groupBanner"],
        groupPicture: snapshot["groupPicture"],
        members: snapshot["members"]);
  }

  Map<String, dynamic> toJson() => {
        "groupId": groupId,
        "groupName": groupName,
        "groupBanner": groupBanner,
        "groupPicture": groupPicture,
        "members": members,
      };

  Community copyWith({
    String? groupId,
    String? groupName,
    String? groupBanner,
    String? groupPicture,
    List<String>? members,
    //List<String>? mods,
  }) {
    return Community(
      groupId: groupId ?? this.groupId,
      groupName: groupName ?? this.groupName,
      groupBanner: groupBanner ?? this.groupBanner,
      groupPicture: groupPicture ?? this.groupPicture,
      members: members ?? this.members,
      //mods: mods ?? this.mods,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'groupId': groupId,
      'groupName': groupName,
      'groupBanner': groupBanner,
      'groupPicture': groupPicture,
      'members': members,
      //'mods': mods,
    };
  }

  factory Community.fromMap(Map<String, dynamic> map) {
    return Community(
      groupId: map['groupId'] ?? '',
      groupName: map['groupName'] ?? '',
      groupBanner: map['groupBanner'] ?? '',
      groupPicture: map['groupPicture'] ?? '',
      members: List<String>.from(map['members']),
      //mods: List<String>.from(map['mods']),
    );
  }

  @override
  String toString() {
    return 'Community(groupId: $groupId, groupName: $groupName, groupBanner: $groupBanner, groupPicture: $groupPicture, members: $members)';
    // mods: $mods
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Community &&
        other.groupId == groupId &&
        other.groupName == groupName &&
        other.groupBanner == groupBanner &&
        other.groupPicture == groupPicture &&
        listEquals(other.members, members);
    //listEquals(other.mods, mods);
  }

  @override
  int get hashCode {
    return groupId.hashCode ^
        groupName.hashCode ^
        groupBanner.hashCode ^
        groupPicture.hashCode ^
        members.hashCode;
    //mods.hashCode;
  }
}
