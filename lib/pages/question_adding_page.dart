import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz/Constants.dart';
import 'package:quiz/widgets/custom_button.dart';
import 'package:quiz/widgets/custom_text_form_field.dart';

import '../widgets/admin_question_making_box.dart';

class QuestionAddingPage extends StatefulWidget {
  QuestionAddingPage({super.key});

  static String id = 'admin';

  @override
  State<QuestionAddingPage> createState() => _QuestionAddingPageState();
}

class _QuestionAddingPageState extends State<QuestionAddingPage> {
  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    VoidCallback UpdateUi =
        ModalRoute.of(context)!.settings.arguments as VoidCallback;
    return Scaffold(
        backgroundColor: KPrimaryColor,
        appBar: AppBar(
          title: Text('Adding Question Page'),
          backgroundColor: KPrimaryColor,
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AdminQuestionMakingBox(
                updateUI: UpdateUi,
              ),
            ),
          ),
        ));
  }
}
