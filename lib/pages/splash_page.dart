import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/Constants.dart';
import 'package:quiz/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
  static String id = 'splasher';
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushNamed(context, LoginPage.id);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quiz App',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Pacifico', fontSize: 40),
            ),
            Lottie.asset(
              'assets/images/animation_lk468o1t.json',
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 50,
            ),
            SpinKitWave(
              color: Colors.black,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
