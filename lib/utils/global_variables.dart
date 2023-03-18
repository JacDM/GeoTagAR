import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/screens/discoverPages/discover.dart';
import 'package:geotagar/screens/feed.dart';
import 'package:geotagar/screens/memory_related/createMemoryRoute.dart';
import 'package:geotagar/screens/scrapbook_locations.dart';
import 'package:geotagar/screens/memory_related/post_memory.dart';
import 'package:image_picker/image_picker.dart';

import '../screens/userAccountScreens/user_profile.dart';
// import 'package:instagram_clone_flutter/screens/add_post_screen.dart';
// import 'package:instagram_clone_flutter/screens/feed_screen.dart';
// import 'package:instagram_clone_flutter/screens/profile_screen.dart';
// import 'package:instagram_clone_flutter/screens/search_screen.dart';

//const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const Feed(),
  const scrapBookLocations(),
  const Feed(),
  const DiscoverPage(),
  UserProfile(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
