import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notepad/screens/note_view.dart';
import 'package:notepad/screens/signup_screen.dart';
import 'package:sign_button/sign_button.dart';

import '../view_models/auth_view_model.dart';

class OpenSans extends StatelessWidget {
  final text;
  final size;
  final color;
  final fontWeight;
  const OpenSans(
      {Key? key,
      required this.text,
      required this.size,
      this.color,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: GoogleFonts.openSans(
        fontSize: size,
        color: color == null ? Colors.black : color,
        fontWeight: fontWeight == null ? FontWeight.normal : fontWeight,
      ),
    );
  }
}

class Poppins extends StatelessWidget {
  final text;
  final size;
  final color;
  final fontWeight;
  const Poppins(
      {Key? key,
      required this.text,
      required this.size,
      this.color,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: GoogleFonts.poppins(
        fontSize: size,
        color: color == null ? Colors.black : color,
        fontWeight: fontWeight == null ? FontWeight.normal : fontWeight,
      ),
    );
  }
}

TextEditingController _nameController = TextEditingController();
TextEditingController _userNameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class TextForm extends StatelessWidget {
  // final AuthViewModel _authViewModel = Get.put(AuthViewModel());
  final text;
  final hintText;
  final controller;
  TextForm({
    Key? key,
    required this.text,
    required this.hintText,
    // required TextEditingController controller,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OpenSans(
            size: 13.0,
            text: text,
          ),
          SizedBox(height: 5.0),
          SizedBox(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.tealAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                hintText: hintText,
                hintStyle: GoogleFonts.poppins(fontSize: 13.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterAndLogin extends StatelessWidget {
  final text;

  const RegisterAndLogin({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Login
        SizedBox(
          height: 50.0,
          width: 150.0,
          child: MaterialButton(
            child: OpenSans(
              text: text,
              size: 24.0,
              color: Colors.white,
            ),
            onPressed: () async {
              await Get.off(NoteViewScreen());
              // var userName = _userNameController.text.trim();
              // var name = _nameController.text.trim();
              // var userEmail = _emailController.text.trim();
              // var userPassword = _passwordController.text.trim();
              // await FirebaseAuth.instance
              //     .createUserWithEmailAndPassword(
              //         email: userEmail, password: userPassword)
              //     .then((value) => {
              //           FirebaseFirestore.instance
              //               .collection('users')
              //               .doc()
              //               .set({
              //             userName: 'userName',
              //             name: 'name',
              //             userEmail: 'userEmail'
              //           }),
              //         });
              //await ;
            },
            splashColor: Colors.grey,
            color: Colors.black,
            elevation: 2.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
      ],
    );
  }
}

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SignInButton(
        buttonType: ButtonType.google,
        btnColor: Colors.black,
        btnTextColor: Colors.white,
        buttonSize: ButtonSize.large, // small(default), medium, large
        onPressed: () async {},
      ),
    );
  }
}

DialogBox(BuildContext context, String title) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      contentPadding: EdgeInsets.all(32.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(width: 2.0, color: Colors.black),
      ),
      title: OpenSans(
        text: title,
        size: 20.0,
      ),
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          color: Colors.black,
          child: OpenSans(
            text: "Okay",
            size: 20.0,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

class NoteViewModel {}
