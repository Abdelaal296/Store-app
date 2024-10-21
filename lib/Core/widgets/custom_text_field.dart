import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField(
      {super.key, required this.hintText, required this.controller,this.obsecure=false,this.inputType,this.onChanged});

  final String hintText;
  final TextEditingController? controller;
   bool? obsecure;
   TextInputType? inputType;
   void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: obsecure!,
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: textFormBorder(),
          border: textFormBorder()),
    );
  }
}

OutlineInputBorder textFormBorder() {
  return  OutlineInputBorder(
      borderSide: BorderSide(),
      borderRadius: BorderRadius.circular(8.0),
      
      );
}
