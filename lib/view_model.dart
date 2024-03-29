import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart' as google;
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:notepad/screens/edit_note_screen.dart';
import 'package:notepad/screens/login_screen.dart';
import 'package:notepad/screens/note_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'components/components.dart';
import 'model.dart';

class AuthViewModel extends GetxController {
  var logger = Logger();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User?> currentUser = Rx<User?>(null);

  @override
  void onInit() {
    currentUser.bindStream(authStateChange);
    super.onInit();
  }

  Stream<User?> get authStateChange => _auth.authStateChanges();

  RxList<Note> notes = RxList<Note>([]);

  Future<void> signInWithEmailAndPassword(
      BuildContext context, String _email, String _password) async {
    await _auth
        .signInWithEmailAndPassword(email: _email, password: _password)
        .then((value) {
      logger.d("Login successful");
      Get.offAll(() => NoteViewScreen());
    }).onError((error, stackTrace) {
      logger.d(error);
      DialogBox(context, error.toString().replaceAll(RegExp('\\[.*?\\]'), ''));
    });
  }

  Future<void> createUserWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      logger.d("Login successful");
      Get.offAll(() => NoteViewScreen());
    }).onError((error, stackTrace) {
      logger.d(error);
      DialogBox(context, error.toString().replaceAll(RegExp('\\[.*?\\]'), ''));
    });
  }

  Future<void> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount =
          await google.GoogleSignIn().signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await _auth.signInWithCredential(credential);

        Get.offAll(() => NoteViewScreen());
      }
    } catch (error) {
      Get.snackbar('Error', error.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      currentUser.value = null; // Clear the user state
      Get.offAll(() => LoginScreen()); // Navigate to the sign-in screen
    } catch (error) {
      Get.snackbar('Error', error.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}

final AuthViewModel _authViewModel = Get.put(AuthViewModel());

class NoteViewModel extends GetxController {
  TextEditingController noteController = TextEditingController();
  var logger = Logger();

  RxList<Note> notes = RxList<Note>([]);

  @override
  void onInit() {
    fetchNotes();
    super.onInit();
  }

  Future<void> fetchNotes() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        var snapshot = await FirebaseFirestore.instance
            .collection("notes")
            .where("userId", isEqualTo: user.uid) // Filter by user's UID
            .orderBy("createdAt", descending: true)
            .get();

        notes.assignAll(snapshot.docs
            .map((doc) =>
                Note.fromMap(doc.data() as Map<String, dynamic>, doc.id))
            .toList());
      }
    } catch (error) {
      print("Error fetching notes: $error");
    }
  }

  Future<void> addNote(String noteContent) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        // If user is not logged in, show an error or handle it accordingly
        print("User not logged in");
        return;
      }

      // Check if the note is empty
      if (noteContent.trim().isEmpty) {
        // If note is empty, show an error or handle it accordingly
        print("Note content is empty");
        return;
      }

      // Add note to Firebase
      await FirebaseFirestore.instance.collection("notes").add({
        "note": noteContent.trim(),
        "userId": user.uid,
        "createdAt": DateTime.now(),
      });

      await fetchNotes();
    } catch (error) {
      print("Error adding note: $error");
    }
  }

  Future<void> deleteNote(String noteId) async {
    try {
      await FirebaseFirestore.instance.collection("notes").doc(noteId).delete();
      await fetchNotes();
    } catch (error) {
      // Handle error
      print("Error deleting note: $error");
    }
  }

  Future<void> editNote(Note note, String updatedContent) async {
    try {
      var updatedNote = await Get.to(() => EditNoteScreen(),
          arguments: {'note': note, 'noteContent': updatedContent});

      if (updatedNote != null && updatedNote is Note) {
        await FirebaseFirestore.instance
            .collection("notes")
            .doc(note.id)
            .update({
          'note': updatedNote.content,
        });

        await fetchNotes();
      }
    } catch (error) {
      // Handle error
      print("Error editing note: $error");
    }
  }

  Future<void> updateNoteContent(Note note, String updatedContent) async {
    try {
      noteController.text = updatedContent.trim();
      await FirebaseFirestore.instance
          .collection("notes")
          .doc(note.id)
          .update({'note': updatedContent.trim()});

      await fetchNotes();
    } catch (error) {
      // Handle error
      print("Error updating note content: $error");
    }
  }

  Future<void> signout() async {
    try {
      await _authViewModel.signOut();
    } catch (error) {
      print("Error signing out: $error");
    }
  }
}
