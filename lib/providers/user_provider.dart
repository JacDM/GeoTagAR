import 'package:flutter/material.dart';
import 'package:geotagar/models/users.dart';

import '../services/auth.dart';

// class UserProvider with ChangeNotifier {
//   UserModel? _user;
//   final AuthMethods _authMethods = AuthMethods();

//   UserModel get getUser => _user!;
//   Future<void> refreshUser() async {
//     UserModel user = await _authMethods.getUserDetails();
//     _user = user;
//     notifyListeners();
//   }
// }

//Write in Register.dart
// Future<model.USer> getUserDetails() async {
//     User currentUser = FirebaseAuth.instance.currentUser!;
//     DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).get();
//     return models.User.fromSnap(snap);

    
// }