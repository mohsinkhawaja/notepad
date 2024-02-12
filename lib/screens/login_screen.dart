import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/components/components.dart';
import 'package:notepad/screens/signup_screen.dart';

import '../view_model.dart';

class LoginScreen extends StatelessWidget {
  final AuthViewModel _authViewModel = Get.put(AuthViewModel());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = Get.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: deviceHeight / 5.5),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Poppins(
                  text: 'SignIn',
                  size: 30.0,
                  color: Colors.black,
                ),
              ),
              EmailPasswordFields(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Login(),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OpenSans(text: "Don't have any account?", size: 15.0),
                  TextButton(
                    child: Text(
                      "SignUp here",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    onPressed: () async {
                      await Get.toNamed('/SignUpScreen');
                    },
                  )
                ],
              ),
              GoogleSignIn(),
            ],
          ),
        ),
      ),
    );
  }
}
