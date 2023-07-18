import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quiz/Constants.dart';
import 'package:quiz/helpers/snack_bar.dart';
import 'package:quiz/widgets/custom_text_form_field.dart';
import '../widgets/Custom_button.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static String id = 'Register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? name, email, password, phone;

  bool isLodaing = false;

  GlobalKey<FormState> formKey = GlobalKey();
  CollectionReference users =
      FirebaseFirestore.instance.collection(KUsersCollection);
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLodaing,
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
                      'assets/images/register.json',
                      width: 350,
                      height: 300,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      hintText: 'Full name',
                      onChanged: (data) {
                        name = data;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'ُEmail',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      onChanged: (data) {
                        password = data;
                      },
                      hintText: 'Password',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      inputType: TextInputType.number,
                      onChanged: (data) {
                        phone = data;
                      },
                      hintText: 'phone',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          isLodaing = true;
                          setState(() {});
                          await Register(context);
                        }
                      },
                      text: 'Register',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already hava an account ? ',
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login now',
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

  Future<void> Register(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
      isLodaing = false;
      setState(() {});
      users.add({
        KEmail: email,
        KUsername: name,
        KPhone: phone,
      });
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.topSlide,
        showCloseIcon: false,
        title: 'Check Inbox',
        desc: 'Check your inbox to verify your account',
        btnOkOnPress: () {
          Future.delayed(
              Duration(milliseconds: 500), () => Navigator.pop(context));
        },
      ).show();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        isLodaing = false;
        setState(() {});
        showSnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        isLodaing = false;
        setState(() {});
        showSnackBar(context, 'The account already exists for that email.');
      }
    } catch (e) {
      isLodaing = false;
      setState(() {});
      showSnackBar(context, 'There is an error');
    }
  }
}
