import 'package:flutter/material.dart';

class ChatImageWidget extends StatelessWidget {
  const ChatImageWidget({
    super.key,
    required this.imageUrl
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      width: 150,
    );
  }
}
