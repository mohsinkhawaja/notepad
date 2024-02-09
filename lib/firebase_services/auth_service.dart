// services/auth_service.dart
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

import '../components/components.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //final GoogleSignIn _googleSignIn = GoogleSignIn();
  var logger = Logger();
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Stream<User?> get authStateChange => _auth.authStateChanges();
  final StreamController<User?> _authStateController =
      StreamController<User?>();

  Stream<User?> get authStateChanges => _authStateController.stream;

  AuthService() {
    _auth.authStateChanges().listen((User? user) {
      _authStateController.add(user);
    });
  }

  Future<void> createUserWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      logger.d("Login successful");
    }).onError((error, stackTrace) {
      logger.d(error);
      DialogBox(context, error.toString().replaceAll(RegExp('\\[.*?\\]'), ''));
    });
  }

  Future<void> signInWithEmailAndPassword(
      BuildContext context, String _email, String _password) async {
    await _auth
        .signInWithEmailAndPassword(email: _email, password: _password)
        .then((value) {
      logger.d("Login successful");
    }).onError((error, stackTrace) {
      logger.d(error);
      DialogBox(context, error.toString().replaceAll(RegExp('\\[.*?\\]'), ''));
    });
  }
}
// Future<User?> signUpWithEmailPassword(String email, String password) async {
//   try {
//     final UserCredential userCredential =
//         await _auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     return userCredential.user;
//   } catch (e) {
//     print('Error signing up: $e');
//     return null;
//   }
// }
//

//
// Future<void> signInWithGoogleMobile(BuildContext context) async {
//   GoogleSignIn googleSignIn;
//   GoogleSignInAccount? data;
//
//   googleSignIn = GoogleSignIn(scopes: [
//     'https://www.googleapis.com/auth/userinfo.email',
//     'https://www.googleapis.com/auth/userinfo.profile'
//   ]);
//
//   data = await googleSignIn.signIn();
//   if (data != null) {
//     print(data);
//   } else {
//     DialogBox(context, 'Something went wrong');
//     return;
//   }
//
//   final GoogleSignInAuthentication? googleAuth = await data.authentication;
//
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );
//
//   await _auth.signInWithCredential(credential).then(
//     (value) async {
//       logger.e("Signed in successfully $value");
//     },
//   ).onError((error, stackTrace) {
//     logger.d(error);
//   });
// }
//
//   Future<void> signOut() async {
//     await _auth.signOut();
//     await _googleSignIn.signOut();
//   }
// }
