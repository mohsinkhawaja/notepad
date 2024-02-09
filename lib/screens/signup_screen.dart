import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../components/components.dart';
import '../view_models/auth_view_model.dart';

TextEditingController _nameController = TextEditingController();
TextEditingController _userNameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class SignUpScreen extends StatelessWidget {
  final AuthViewModel _authViewModel = Get.put(AuthViewModel());

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
              controller: _nameController,
              text: "Name",
              hintText: "Enter your name",
            ),
            TextForm(
              text: "User Name",
              hintText: "username",
              controller: _userNameController,
            ),
            TextForm(
              text: "Email",
              hintText: "abc@gmail.com",
              controller: _emailController,
            ),
            TextForm(
              text: "Password",
              hintText: "Password",
              controller: _passwordController,
            ),
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
