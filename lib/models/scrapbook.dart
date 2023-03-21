import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geotagar/models/posts.dart';

class Scrapbook {
  final String scrapbookId;
  final String scrapbookName;
  final String scrapbookBanner;
  final String scrapbookDescription;
  final dynamic location;
  final List<Post> posts;
  Scrapbook({
    required this.scrapbookId,
    required this.scrapbookName,
    required this.scrapbookBanner,
    required this.posts,
    required this.scrapbookDescription,
    required this.location,
  });

  static Scrapbook fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Scrapbook(
        scrapbookId: snapshot["scrapbookId"],
        scrapbookName: snapshot["scrapbookName"],
        scrapbookBanner: snapshot["scrapbookBanner"],
        scrapbookDescription: snapshot["scrapbookpDescription"],
        posts: snapshot["posts"],
        location: snapshot["location"]); 
  }

  Map<String, dynamic> toJson() => {
        "scrapbookId": scrapbookId,
        "scrapbookName": scrapbookName,
        "scrapbookBanner": scrapbookBanner,
        "scrapbookDescription": scrapbookDescription,
        "posts": posts,
      };

  // Scrapbook copyWith({
  //   String? groupId,
  //   String? groupName,
  //   String? groupBanner,
  //   String? groupPicture,
  //   List<String>? posts,
  //   List<String>? mods,
  // }) {
  //   return Scrapbook(
  //     groupId: groupId ?? this.groupId,
  //     groupName: groupName ?? this.groupName,
  //     groupBanner: groupBanner ?? this.groupBanner,
  //     groupPicture: groupPicture ?? this.groupPicture,
  //     posts: posts ?? this.posts,
  //     mods: mods ?? this.mods,
  //   );
  // }

  Map<String, dynamic> toMap() {
    return {
      'scrapbookId': scrapbookId,
      'scrapbookName': scrapbookName,
      'scrapbookBanner': scrapbookBanner,
      'posts': posts,
      'scrapbookDescription': scrapbookDescription,
    };
  }

  factory Scrapbook.fromMap(Map<String, dynamic> map) {
    return Scrapbook(
      scrapbookId: map['id'] ?? '',
      scrapbookName: map['name'] ?? '',
      scrapbookBanner: map['banner'] ?? '',
      scrapbookDescription: map['description'] ?? '',
      posts: List<Post>.from(map['posts']),
      location: map['location'],);
  }
}
