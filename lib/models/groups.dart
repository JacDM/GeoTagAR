import 'package:cloud_firestore/cloud_firestore.dart';

class Group {
  final String id;
  final String description;
  final String name;
  final String banner;
  final String avatar;
  final List<String> members;
  //final List<String> mods;

  const Group({
    required this.id,
    required this.description,
    required this.name,
    required this.banner,
    required this.avatar,
    required this.members,
  });

  static Group fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Group(
      description: snapshot["description"],
      id: snapshot["id"],
      name: snapshot["name"],
      banner: snapshot["banner"],
      avatar: snapshot["avatar"],
      members: snapshot["members"],
    );
  }

  Map<String, dynamic> toJson() => {
        "description": description,
        "id": id,
        "name": name,
        "members": members,
        "banner": banner,
        "avatar": avatar,
      };
}
