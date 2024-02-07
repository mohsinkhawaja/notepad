// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDCLZ3QO_dsGNy1lq_dVQ-OH9YVMdXaaGM',
    appId: '1:486161954428:web:70dba940afe63f7e877bf9',
    messagingSenderId: '486161954428',
    projectId: 'notepad-app-90651',
    authDomain: 'notepad-app-90651.firebaseapp.com',
    storageBucket: 'notepad-app-90651.appspot.com',
    measurementId: 'G-VE0885CS41',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKCKXLrW0Hce8QRy7i1np63U0fQE8g8KM',
    appId: '1:486161954428:android:e35adfd9ce892af5877bf9',
    messagingSenderId: '486161954428',
    projectId: 'notepad-app-90651',
    storageBucket: 'notepad-app-90651.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzdnUXGoYEJ27jZEwWkzyu6TcHw3XQkBA',
    appId: '1:486161954428:ios:19a7f6e64b7fa15b877bf9',
    messagingSenderId: '486161954428',
    projectId: 'notepad-app-90651',
    storageBucket: 'notepad-app-90651.appspot.com',
    iosBundleId: 'com.example.notepad',
  );
}
