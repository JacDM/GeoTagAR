import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:geotagar/screens/userLogIn_Register/log_in.dart';

abstract class FirebaseService {
  Future logIn(
      {required String email, required String password});
  Future<String> signUp(
      {required String email,
      required String password,
      required String username,
      required String name,
      //required int age,
      String? profilePic,
      Uint8List? file,
      String? gender,
      required String accountType});
  //Future<void> signOut();
  //Future<void> sendPasswordResetEmail({required String email});
}
