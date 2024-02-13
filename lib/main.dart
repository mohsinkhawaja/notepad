import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notepad/responsive_handler.dart';
import 'package:notepad/screens/edit_note_screen.dart';
import 'package:notepad/screens/signup_screen.dart';
import 'package:notepad/view_model.dart';
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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // initialBinding: BindingsBuilder(() {
      //   Get.put(NoteViewModel());
      // }),
      initialRoute: '/', // Add an initial route
      getPages: [
        GetPage(name: '/', page: () => ResponsiveHandler()),
        GetPage(name: '/SignUpScreen', page: () => SignUpScreen()),
        GetPage(name: '/NoteViewScreen', page: () => NoteViewScreen()),
        GetPage(name: '/CreateNoteScreen', page: () => CreateNoteScreen()),
        GetPage(name: '/EditNoteScreen', page: () => EditNoteScreen()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
