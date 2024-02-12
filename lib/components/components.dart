import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_button/sign_button.dart';

import '../view_model.dart';

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

class EmailPasswordFields extends StatelessWidget {
  final AuthViewModel _authViewModel = Get.put(AuthViewModel());

  EmailPasswordFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Email
        SizedBox(
          width: 350.0,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            controller: _emailController,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                  size: 30.0,
                ),
                hintText: "Email",
                hintStyle: GoogleFonts.openSans()),
          ),
        ),
        SizedBox(height: 20),
        //Password
        SizedBox(
          width: 350.0,
          child: TextFormField(
            textAlign: TextAlign.center,
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                prefixIcon: Icon(
                  Icons.visibility,
                  color: Colors.black,
                  size: 30.0,
                ),
                hintText: "Password",
                hintStyle: GoogleFonts.openSans()),
          ),
        ),
      ],
    );
  }
}

class RegistrationFields extends StatelessWidget {
  const RegistrationFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Email
        SizedBox(
          width: 350.0,
          child: TextFormField(
            textAlign: TextAlign.center,
            controller: _nameController,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                prefixIcon: Icon(
                  Icons.person_add_alt_1_outlined,
                  color: Colors.black,
                  size: 30.0,
                ),
                hintText: "Name",
                hintStyle: GoogleFonts.openSans()),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: 350.0,
          child: TextFormField(
            textAlign: TextAlign.center,
            controller: _userNameController,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                prefixIcon: Icon(
                  Icons.verified_user_sharp,
                  color: Colors.black,
                  size: 30.0,
                ),
                hintText: "username",
                hintStyle: GoogleFonts.openSans()),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: 350.0,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            controller: _emailController,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                  size: 30.0,
                ),
                hintText: "Email",
                hintStyle: GoogleFonts.openSans()),
          ),
        ),
        SizedBox(height: 20),
        //Password
        SizedBox(
          width: 350.0,
          child: TextFormField(
            textAlign: TextAlign.center,
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                prefixIcon: Icon(
                  Icons.visibility,
                  color: Colors.black,
                  size: 30.0,
                ),
                hintText: "Password",
                hintStyle: GoogleFonts.openSans()),
          ),
        ),
      ],
    );
  }
}

class Login extends StatelessWidget {
  final AuthViewModel _authViewModel = Get.put(AuthViewModel());
  Login({
    super.key,
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
              text: "Sign In",
              size: 24.0,
              color: Colors.white,
            ),
            onPressed: () async {
              await _authViewModel.signInWithEmailAndPassword(
                  context, _emailController.text, _passwordController.text);
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

class Signup extends StatelessWidget {
  final AuthViewModel _authViewModel = Get.put(AuthViewModel());
  Signup({
    super.key,
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
              text: "Sign Up",
              size: 24.0,
              color: Colors.white,
            ),
            onPressed: () async {
              await _authViewModel.createUserWithEmailAndPassword(
                  context, _emailController.text, _passwordController.text);
              // var userName = _userNameController.text.trim();
              // var name = _nameController.text.trim();
              // var userEmail = _emailController.text.trim();
              // var userPassword = _passwordController.text.trim();
              //
              // try {
              //   UserCredential userCredential =
              //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
              //     email: userEmail,
              //     password: userPassword,
              //   );
              //
              //   await FirebaseFirestore.instance
              //       .collection('users')
              //       .doc(userCredential.user?.uid)
              //       .set({
              //     'userName': userName,
              //     'name': name,
              //     'userEmail': userEmail,
              //   });
              //
              //   Get.off(NoteViewScreen());
              // } catch (e) {
              //   print("Error signing up: $e");
              //   // Handle the error, you can also show a dialog or toast here
              // }
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
  final AuthViewModel _authViewModel = Get.put(AuthViewModel());

  GoogleSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SignInButton(
        buttonType: ButtonType.google,
        btnColor: Colors.black,
        btnText: 'Sign Up with Google',
        btnTextColor: Colors.white,
        buttonSize: ButtonSize.large, // small(default), medium, large
        onPressed: () async {
          await _authViewModel.signInWithGoogle();
        },
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
