import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import 'components.dart';

class ViewModel {
  final _auth = FirebaseAuth.instance;

  var logger = Logger();
  //Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  //user registration
  Future<void> createUserWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      logger.d("Login successful");
    }).onError((error, stackTrace) {
      logger.d(error);
      DialogBox(
        context,
        "Something went wrong",
      );
    });
  }

  //Sign in with email and password
  Future<void> signInWithEmailAndPassword(
      BuildContext context, String _email, String _password) async {
    await _auth
        .signInWithEmailAndPassword(email: _email, password: _password)
        .then((value) {
      logger.d("Login successful");
    }).onError((error, stackTrace) {
      logger.d(error);
      DialogBox(context, "Something went wrong");
    });
  }

  //Signin with google
}
