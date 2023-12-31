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
        return macos;
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
    apiKey: 'AIzaSyC3SZ0nP9Bj8M-U4OKAnHR7dIXd33kRFs8',
    appId: '1:969739910149:web:f18043c8cf8b73982a706c',
    messagingSenderId: '969739910149',
    projectId: 'quiz-bec08',
    authDomain: 'quiz-bec08.firebaseapp.com',
    storageBucket: 'quiz-bec08.appspot.com',
    measurementId: 'G-WMZRH27H4M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAuYP7J9jtKHPPf5iwUfGuWvM-K5htFHGg',
    appId: '1:969739910149:android:f4f2b9295a8271ed2a706c',
    messagingSenderId: '969739910149',
    projectId: 'quiz-bec08',
    storageBucket: 'quiz-bec08.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDL5zETPT86EX2y6ljLYenqNj8mN9sJX7Y',
    appId: '1:969739910149:ios:e0836356b0c44d7e2a706c',
    messagingSenderId: '969739910149',
    projectId: 'quiz-bec08',
    storageBucket: 'quiz-bec08.appspot.com',
    iosClientId: '969739910149-7vvbbquuovh000ne9rkcdp7a8u51kuto.apps.googleusercontent.com',
    iosBundleId: 'com.example.quiz',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDL5zETPT86EX2y6ljLYenqNj8mN9sJX7Y',
    appId: '1:969739910149:ios:67a6b61cd61a02bd2a706c',
    messagingSenderId: '969739910149',
    projectId: 'quiz-bec08',
    storageBucket: 'quiz-bec08.appspot.com',
    iosClientId: '969739910149-7im62iejhblpiv3lvdiuc5q3gt4jjp71.apps.googleusercontent.com',
    iosBundleId: 'com.example.quiz.RunnerTests',
  );
}
