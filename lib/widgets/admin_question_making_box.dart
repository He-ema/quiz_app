import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz/Constants.dart';
import 'package:quiz/widgets/custom_button.dart';
import 'package:quiz/widgets/custom_text_form_field.dart';

class AdminQuestionMakingBox extends StatelessWidget {
  AdminQuestionMakingBox({
    super.key,
    this.updateUI,
  });

  VoidCallback? updateUI;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  CollectionReference question =
      FirebaseFirestore.instance.collection(KQuestionCollection);
  String? title, firstQ, secondQ, thirdQ, fourthQ;
  int? trueAns;
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Question title',
            onChanged: (data) {
              title = data;
            },
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            hintText: 'First question',
            onChanged: (data) {
              firstQ = data;
            },
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            hintText: 'Second question',
            onChanged: (data) {
              secondQ = data;
            },
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            hintText: 'Third question',
            onChanged: (data) {
              thirdQ = data;
            },
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            hintText: 'Fourth Question',
            onChanged: (data) {
              fourthQ = data;
            },
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            hintText: 'Number of True answer',
            inputType: TextInputType.number,
            onChanged: (data) {
              trueAns = int.parse(data);
            },
          ),
          SizedBox(
            height: 15,
          ),
          CustomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  question.add({
                    KTitle: title,
                    KAns1: firstQ,
                    KAns2: secondQ,
                    KAns3: thirdQ,
                    KAns4: fourthQ,
                    KTrueAns: trueAns,
                    KCreatedAt: DateTime.now(),
                  });
                  updateUI!();
                  Navigator.pop(context);
                }
              },
              text: 'Add'),
        ],
      ),
    );
  }
}
