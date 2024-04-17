import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return Scaffold(
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
          );
        },
      ),
    );
  }
}
