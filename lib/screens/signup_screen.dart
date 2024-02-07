import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../components.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = Get.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: deviceHeight / 5.5),
            Poppins(
              text: "Register here",
              size: 30.0,
              color: Colors.black,
            ),
            TextForm(
              text: "Name",
              hintText: "Enter your name",
            ),
            TextForm(text: "Email", hintText: "abc@gmail.com"),
            TextForm(text: "Password", hintText: "*********"),
            TextForm(text: "Re-enter Password", hintText: "Confirm Password"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: RegisterAndLogin(text: "Sign Up"),
            ),
            GoogleSignIn(),
          ],
        ),
      ),
    );
  }
}
