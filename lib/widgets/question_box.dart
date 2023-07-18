import 'package:flutter/material.dart';

import '../models/question_model.dart';
import 'choice_elements.dart';

class questionBox extends StatefulWidget {
  questionBox({required this.question, required this.index});

  @override
  QuestionModel question;
  int index;

  @override
  State<questionBox> createState() => _questionBoxState();
}

class _questionBoxState extends State<questionBox> {
  Color color = Colors.transparent;

  int choice = 0;
  bool pressed = false;

  List<Color> colorsList = [
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent
  ];

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: Text(
                '${widget.index}-${widget.question.title}',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          ChoiceElement(
            text: widget.question.ans1,
            color: colorsList[0],
            onTap: () {
              if (!pressed) {
                choice = 1;
                if (widget.question.trueAns == 1 && choice == 1) {
                  colorsList[0] = Colors.green;
                } else if (widget.question.trueAns != 1 && choice == 1) {
                  colorsList[0] = Colors.red;
                }
                colorsList[widget.question.trueAns - 1] = Colors.green;
                setState(() {});
                pressed = true;
              }
            },
          ),
          ChoiceElement(
            color: colorsList[1],
            text: widget.question.ans2,
            onTap: () {
              if (!pressed) {
                choice = 2;
                if (widget.question.trueAns == 2 && choice == 2) {
                  colorsList[1] = Colors.green;
                } else if (widget.question.trueAns != 2 && choice == 2) {
                  colorsList[1] = Colors.red;
                }
                colorsList[widget.question.trueAns - 1] = Colors.green;
                setState(() {});
                pressed = true;
              }
            },
          ),
          ChoiceElement(
            color: colorsList[2],
            text: widget.question.ans3,
            onTap: () {
              if (!pressed) {
                choice = 3;
                if (widget.question.trueAns == 3 && choice == 3) {
                  colorsList[2] = Colors.green;
                } else if (widget.question.trueAns != 3 && choice == 3) {
                  colorsList[2] = Colors.red;
                }
                colorsList[widget.question.trueAns - 1] = Colors.green;
                setState(() {});
                pressed = true;
              }
            },
          ),
          ChoiceElement(
            color: colorsList[3],
            text: widget.question.ans4,
            onTap: () {
              if (!pressed) {
                choice = 4;
                if (widget.question.trueAns == 4 && choice == 4) {
                  colorsList[3] = Colors.green;
                } else if (widget.question.trueAns != 4 && choice == 4) {
                  colorsList[3] = Colors.red;
                }
                colorsList[widget.question.trueAns - 1] = Colors.green;
                setState(() {});
                pressed = true;
              }
            },
          ),
          Divider(color: Colors.white),
        ],
      ),
    );
  }
}
