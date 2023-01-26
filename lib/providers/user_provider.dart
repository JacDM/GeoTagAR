import 'package:flutter/material.dart';
import 'package:geotagar/models/users.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  //final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;
  Future<void> refreshUser() async {
    //User user = await _authMethods.getUserDetails();
    //_user = user;
    notifyListeners();
  }
}

//Write in Register.dart
// Future<model.USer> getUserDetails() async {
//     User currentUser = FirebaseAuth.instance.currentUser!;
//     DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).get();
//     return models.User.fromSnap(snap);

    
// }