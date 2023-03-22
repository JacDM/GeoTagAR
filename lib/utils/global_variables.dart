import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/screens/admin_pages/admin_profile.dart';
import 'package:geotagar/screens/admin_pages/groups_page.dart';
import 'package:geotagar/screens/discoverPages/discover.dart';
import 'package:geotagar/screens/feed.dart';
import 'package:geotagar/screens/memory_related/createMemoryRoute.dart';
import 'package:geotagar/screens/scrapbook_locations.dart';
import 'package:geotagar/screens/memory_related/post_memory.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geotagar/ar/ar.dart';
import '../screens/admin_pages/report_page.dart';
import '../screens/userAccountScreens/user_profile.dart';
// import 'package:instagram_clone_flutter/screens/add_post_screen.dart';
// import 'package:instagram_clone_flutter/screens/feed_screen.dart';
// import 'package:instagram_clone_flutter/screens/profile_screen.dart';
// import 'package:instagram_clone_flutter/screens/search_screen.dart';

//const webScreenSize = 600;

List<Widget> homeScreenItems = [
  Feed(uid: FirebaseAuth.instance.currentUser!.uid),
  const scrapBookLocations(),
  const CMRoute(), //ARState(),
  const DiscoverPage(),
  UserProfile(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];

List<Widget> webScreenItems = [
  ReportedPostsPage(uid: FirebaseAuth.instance.currentUser!.uid),
  //const uSERSPage(),
  const GroupsPage(), //ARState(),
  AdminProfile(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
