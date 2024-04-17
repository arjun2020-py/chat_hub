import 'package:flutter/material.dart';

import '../custom_color/custom_color.dart';

class ChatTextFiled extends StatelessWidget {
  ChatTextFiled(
      {super.key, required this.hintText, this.controller, this.validator});
  final String hintText;
  TextEditingController? controller;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
            filled: true,
            fillColor: whiteColor),
      ),
    );
  }
}
