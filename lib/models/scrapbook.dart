import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geotagar/models/posts.dart';

class Scrapbook {
  final String scrapbookId;
  final String scrapbookName;
  final String scrapbookThumbnail;
  final String scrapbookDescription;
  final dynamic location;
  final List<Post> postId;
  final bool isPrivate;
  Scrapbook({
    required this.scrapbookId,
    required this.scrapbookName,
    required this.scrapbookThumbnail,
    required this.postId,
    required this.scrapbookDescription,
    required this.location,
    required this.isPrivate,
  });

  static Scrapbook fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Scrapbook(
        scrapbookId: snapshot["scrapbookId"],
        scrapbookName: snapshot["scrapbookName"],
        scrapbookThumbnail: snapshot["scrapbookThumbnail"],
        scrapbookDescription: snapshot["scrapbookpDescription"],
        postId: snapshot["postId"],
        location: snapshot["location"],
        isPrivate: snapshot["isPrivate"]);
  }

  Map<String, dynamic> toJson() => {
        "scrapbookId": scrapbookId,
        "scrapbookName": scrapbookName,
        "scrapbookThumbnail": scrapbookThumbnail,
        "scrapbookDescription": scrapbookDescription,
        "postId": postId,
        "location": location,
        "isPrivate": isPrivate,
      };

  // Scrapbook copyWith({
  //   String? groupId,
  //   String? groupName,
  //   String? groupthumbnail,
  //   String? groupPicture,
  //   List<String>? postId,
  //   List<String>? mods,
  // }) {
  //   return Scrapbook(
  //     groupId: groupId ?? this.groupId,
  //     groupName: groupName ?? this.groupName,
  //     groupthumbnail: groupthumbnail ?? this.groupthumbnail,
  //     groupPicture: groupPicture ?? this.groupPicture,
  //     postId: postId ?? this.postId,
  //     mods: mods ?? this.mods,
  //   );
  // }

  Map<String, dynamic> toMap() {
    return {
      'scrapbookId': scrapbookId,
      'scrapbookName': scrapbookName,
      'scrapbookThumbnail': scrapbookThumbnail,
      'postId': postId,
      'scrapbookDescription': scrapbookDescription,
      'location': location,
      'isPrivate': isPrivate,
    };
  }

  factory Scrapbook.fromMap(Map<String, dynamic> map) {
    return Scrapbook(
      scrapbookId: map['id'] ?? '',
      scrapbookName: map['name'] ?? '',
      scrapbookThumbnail: map['thumbnail'] ?? '',
      scrapbookDescription: map['description'] ?? '',
      postId: List<Post>.from(map['postId']),
      location: map['location'],
      isPrivate: map['isPrivate'],
    );
  }
}
