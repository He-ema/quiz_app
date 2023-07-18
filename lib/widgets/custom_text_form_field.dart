import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.hintText,
      this.onChanged,
      this.obscureText = false,
      this.inputType,
      this.controller,
      this.enabled = true});

  String? hintText;
  Function(String)? onChanged;
  bool obscureText;
  bool enabled;
  TextInputType? inputType;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      obscureText: obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return 'This field is required';
        }
      },
      onChanged: onChanged,
      enabled: enabled,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: 'Enter Your $hintText',
        labelText: hintText,
      ),
    );
  }
}
