import 'package:flutter/material.dart';

import '../models/question_model.dart';

class ChoiceElement extends StatelessWidget {
  ChoiceElement({
    super.key,
    required this.text,
    required this.onTap,
    this.color = Colors.transparent,
  });
  Color color;
  String text;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: double.infinity,
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}
