import 'package:flutter/material.dart';

import '../custom_color/custom_color.dart';

class ChatElevButton extends StatelessWidget {
  ChatElevButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.bgColor,
  });
  final void Function() onPressed;
  final Widget child;
  Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.8,
      height: MediaQuery.sizeOf(context).height * 0.06,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: bgColor,
              side: BorderSide(width: 3, color: whiteColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: onPressed,
          child: child),
    );
  }
}
