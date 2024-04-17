import 'package:flutter/material.dart';

class ChatTextButton extends StatelessWidget {
  const ChatTextButton({super.key, required this.onPressed,required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(text));
  }
}
