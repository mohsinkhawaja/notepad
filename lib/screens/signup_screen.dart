import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../components/components.dart';
import '../view_model.dart';

class SignUpScreen extends StatelessWidget {
  final AuthViewModel _authViewModel = Get.put(AuthViewModel());
  @override
  Widget build(BuildContext context) {
    double deviceHeight = Get.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: deviceHeight / 5.5),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Poppins(
                  text: "Register here",
                  size: 30.0,
                  color: Colors.black,
                ),
              ),
              Center(child: RegistrationFields()),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Signup(),
              ),
              GoogleSignIn(),
            ],
          ),
        ),
      ),
    );
  }
}
