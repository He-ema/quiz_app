import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz/pages/home_page.dart';
import 'package:quiz/pages/login_page.dart';
import 'package:quiz/pages/profile_page.dart';
import 'package:quiz/pages/question_adding_page.dart';
import 'package:quiz/pages/register_page.dart';
import 'package:quiz/pages/splash_page.dart';

import 'firebase_options.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        HomePage.id: (context) => HomePage(),
        QuestionAddingPage.id: (context) => QuestionAddingPage(),
        ProfilePage.id: (context) => ProfilePage(),
      },
      initialRoute: SplashScreen.id,
    );
  }
}
