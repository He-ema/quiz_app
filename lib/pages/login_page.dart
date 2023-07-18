import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quiz/Constants.dart';
import 'package:quiz/helpers/snack_bar.dart';
import 'package:quiz/pages/home_page.dart';
import 'package:quiz/pages/register_page.dart';
import 'package:quiz/widgets/Custom_button.dart';
import 'package:quiz/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static String id = 'loginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email, password;

  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: KPrimaryColor,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Lottie.asset(
                      'assets/images/login3.json',
                      width: 350,
                      height: 300,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'ُEmail',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      onChanged: (data) {
                        password = data;
                      },
                      hintText: 'Password',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          await LoginMethod(context);
                        }
                      },
                      text: 'Login',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Doesn\'t have an account ? ',
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterPage.id);
                          },
                          child: Text(
                            'Register now',
                            style: TextStyle(color: Color(0xffC7EDE6)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> LoginMethod(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      isLoading = false;
      setState(() {});
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null && !user.emailVerified) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.topSlide,
          showCloseIcon: true,
          title: 'Check Inbox',
          desc: 'Check your inbox to verify your account',
          btnOkOnPress: () {},
        ).show();
      } else {
        Navigator.pushNamed(context, HomePage.id, arguments: email);
        emailController.clear();
        passwordController.clear();
      }
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      setState(() {});
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password provided for that user.');
      }
    }
  }
}
