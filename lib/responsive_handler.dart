import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notepad/screens/login_screen.dart';
import 'package:notepad/screens/note_view.dart';
import 'package:notepad/view_model.dart';

class ResponsiveHandler extends StatefulWidget {
  @override
  _ResponsiveHandlerState createState() => _ResponsiveHandlerState();
}

class _ResponsiveHandlerState extends State<ResponsiveHandler> {
  final AuthViewModel _authViewModel = Get.put(AuthViewModel());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      handleAuthentication();
    });
  }

  void handleAuthentication() {
    if (_authViewModel.currentUser.value != null) {
      Get.offAll(() => NoteViewScreen());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
