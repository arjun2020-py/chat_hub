import 'package:flutter/material.dart';

import '../../utils/custom_color/custom_color.dart';
import '../../utils/custom_widgets/custom_icon_butt.dart';
import '../../utils/custom_widgets/custom_text.dart';

class ScreenChat extends StatelessWidget {
  const ScreenChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: ChatTextWidget(
          text: 'ChatHub',
          color: whiteColor,
        ),
        actions: [
          ChatIconButton(
            onPressed: () {},
            icon: Icons.search,
            iconColor: whiteColor,
          ),
          ChatIconButton(
              onPressed: () {}, icon: Icons.logout, iconColor: whiteColor)
        ],
      ),
      body: Center(
        child: Text('chat'),
      ),
    );
  }
}
