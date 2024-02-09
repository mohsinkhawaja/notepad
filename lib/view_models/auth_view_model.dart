import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  // Add authentication functions
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final StreamController<User?> _authStateController =
      StreamController<User?>();

  Stream<User?> get authStateChanges => _authStateController.stream;

  AuthService() {
    _auth.authStateChanges().listen((User? user) {
      _authStateController.add(user);
    });
  }
}
