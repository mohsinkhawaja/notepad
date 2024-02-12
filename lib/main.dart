import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notepad/screens/edit_note_screen.dart';
import 'package:notepad/screens/login_screen.dart';
import 'package:notepad/screens/signup_screen.dart';
import 'firebase_options.dart';
import 'screens/create_notes_screen.dart';
import 'screens/note_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //ThemeController themeController = Get.put(ThemeController());
    return GetMaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),
        GetPage(name: '/SignUpScreen', page: () => SignUpScreen()),
        GetPage(name: '/NoteViewScreen', page: () => NoteViewScreen()),
        GetPage(name: '/CreateNoteScreen', page: () => CreateNoteScreen()),
        GetPage(name: '/EditNoteScreen', page: () => EditNoteScreen()),
        // Add more routes as needed
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
