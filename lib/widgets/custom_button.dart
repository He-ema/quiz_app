import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.onTap, required this.text});
  VoidCallback onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(text)),
    );
  }
}
