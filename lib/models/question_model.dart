import '../Constants.dart';

class QuestionModel {
  final String title, ans1, ans2, ans3, ans4;
  final int trueAns;

  QuestionModel(
      this.title, this.ans1, this.ans2, this.ans3, this.ans4, this.trueAns);

  factory QuestionModel.fromJson(jsonData) {
    return QuestionModel(jsonData[KTitle], jsonData[KAns1], jsonData[KAns2],
        jsonData[KAns3], jsonData[KAns4], jsonData[KTrueAns]);
  }
}
