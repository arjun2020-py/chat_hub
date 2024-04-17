import 'package:chat_hub/utils/custom_color/custom_color.dart';
import 'package:flutter/material.dart';

class ChatIconButton extends StatelessWidget {
  const ChatIconButton(
      {super.key, required this.onPressed, required this.icon,required this.iconColor});
  final void Function()? onPressed;
  final IconData? icon;
  final  Color iconColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: iconColor,
        ));
  }
}
