import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notepad/controllers/login_controller.dart';
import 'package:notepad/screens/signup_screen.dart';
import 'package:notepad/screens/view_screen.dart';
import 'package:sign_button/sign_button.dart';

class EmailAndPasswordFields extends StatefulWidget {
  const EmailAndPasswordFields({super.key});

  @override
  State<EmailAndPasswordFields> createState() => _EmailAndPasswordFieldsState();
}

class _EmailAndPasswordFieldsState extends State<EmailAndPasswordFields> {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    var eyeClosed = true.obs;
    return Column(
      children: [
        //Email Field
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: SizedBox(
            width: 350.0,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.start,
              controller: controller.emailController.value,
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
                hintStyle: GoogleFonts.openSans(),
              ),
            ),
          ),
        ),

        //Password Field
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: SizedBox(
            width: 350.0,
            child: TextFormField(
              textAlign: TextAlign.start,
              controller: controller.passwordController.value,
              obscureText: eyeClosed.value,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  prefixIcon: IconButton(
                    icon: Icon(
                      Icons.lock,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  ),
                  hintText: "Password",
                  hintStyle: GoogleFonts.openSans(),
                  suffix: Obx(() => InkWell(
                        child: eyeClosed.value
                            ? Icon(Icons.visibility_off, color: Colors.grey)
                            : Icon(Icons.visibility, color: Colors.purple),
                        onTap: () {
                          eyeClosed.value = !eyeClosed.value;
                        },
                      ))),
            ),
          ),
        ),
      ],
    );
  }
}

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

class RegisterAndLogin extends StatelessWidget {
  final text;
  const RegisterAndLogin({super.key, required this.text});

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
              await Get.off(ViewScreen());
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

class TextForm extends StatelessWidget {
  final text;
  final hintText;

  const TextForm({
    Key? key,
    required this.text,
    required this.hintText,
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
