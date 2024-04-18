import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/custom_color/custom_color.dart';
import '../../../utils/custom_widgets/custom_image.dart';
import '../../../utils/custom_widgets/custom_text.dart';
import '../cubit/splash_cubit.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(context),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
           var cubit = context.read<SplashCubit>();
          return Container(
              decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
            Color(0xffededed),
            Color(0xffececec),
            Color(0xffebebeb),
            Color(0xffe9e9e9),
            Color(0xffdce5e9),
            Color(0xffcee2ed),
            Color(0xffbdddef),
            Color(0xffbbddf0),
            Color(0xffb8dcf0)
          ])),
            child: Scaffold(
              backgroundColor: transprentColor,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   ChatImageWidget(imageUrl: 'assets/images/wechat.png',),
                    
                  ChatTextWidget(text: 'Chat Hub',fontSize: 20,)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
