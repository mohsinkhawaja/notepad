import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/components.dart';
import 'package:notepad/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              EmailAndPasswordFields(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: RegisterAndLogin(
                  text: "Login",
                ),
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
                      await Get.to(SignUpScreen());
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
