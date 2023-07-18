import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/Constants.dart';
import 'package:quiz/helpers/side_bar.dart';
import 'package:quiz/widgets/custom_button.dart';

import '../models/question_model.dart';
import '../widgets/question_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String id = 'homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void updateUI() {
    setState(() {});
  }

  Future<void> _handleRefresh() async {}

  Widget build(BuildContext context) {
    void logOut() {
      Navigator.pop(context);
      Navigator.pop(context);
    }

    CollectionReference questions =
        FirebaseFirestore.instance.collection(KQuestionCollection);
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return FutureBuilder<QuerySnapshot>(
        future: questions.orderBy(KCreatedAt).get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          List<QuestionModel> questionList = [];
          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              questionList.add(QuestionModel.fromJson(snapshot.data!.docs[i]));
            }
          }
          List<dynamic> questionsIdList = [];

          for (int i = 0; i < questionList.length; i++) {
            questionsIdList.add(snapshot.data!.docs[i].id);
          }

          return Scaffold(
            drawer: SideBar(
              email: email,
              updateUi: updateUI,
              logOut: logOut,
              QuestionIdList: questionsIdList,
            ),
            backgroundColor: KPrimaryColor,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: KPrimaryColor,
              title: Text(
                'Quiz App',
                style: TextStyle(fontFamily: 'Pacifico'),
              ),
            ),
            body: questionList.length == 0
                ? LiquidPullToRefresh(
                    onRefresh: _handleRefresh,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/images/empty.json',
                              width: 350,
                              height: 300,
                            ),
                            Text(
                              'No Questions now',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Pacifico'),
                            ),
                            SizedBox(
                              height: 100,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : LiquidPullToRefresh(
                    onRefresh: _handleRefresh,
                    backgroundColor: KPrimaryColor,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                            questionList.length,
                            (index) => questionBox(
                                question: questionList[index],
                                index: index + 1)),
                      ),
                    ),
                  ),
          );
        });
  }
}
