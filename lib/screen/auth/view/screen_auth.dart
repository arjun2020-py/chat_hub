import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/custom_color/custom_color.dart';
import '../../../utils/custom_widgets/custom_elev_button.dart';
import '../../../utils/custom_widgets/custom_image.dart';
import '../../../utils/custom_widgets/custom_sized_box.dart';
import '../../../utils/custom_widgets/custom_text.dart';
import '../../../utils/custom_widgets/custom_text_button.dart';
import '../../../utils/custom_widgets/custom_textfiled.dart';
import '../../chat/screen_chat.dart';
import '../cubit/auth_cubit.dart';

class ScreenAuth extends StatelessWidget {
  const ScreenAuth({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: BlocProvider(
              create: (context) => AuthCubit(context),
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  var cubit = context.read<AuthCubit>();
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ChatImageWidget(
                          imageUrl: cubit.isChecked
                              ? 'assets/images/mobile.png'
                              : 'assets/images/internet.png',
                        ),
                        verticalChatSizedBox(10),
                        ChatTextWidget(
                          text: cubit.isChecked ? 'Login' : 'Register',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        verticalChatSizedBox(10),
                        cubit.isChecked
                            ? Column(
                                children: [
                                  ChatTextFiled(
                                    controller: cubit.emailCtr,
                                    hintText: 'email',
                                  ),
                                  verticalChatSizedBox(10),
                                  ChatTextFiled(
                                    controller: cubit.passwordCtr,
                                    hintText: 'password'),
                                  verticalChatSizedBox(20),
                                ],
                              )
                            : Column(
                                children: [
                                  ChatTextFiled(
                                    controller: cubit.emailCtr,
                                    hintText: 'email',
                                  ),
                                  verticalChatSizedBox(10),
                                  ChatTextFiled(
                                    controller: cubit.usernameCtr,
                                    hintText: 'username'),
                                  verticalChatSizedBox(10),
                                  ChatTextFiled(
                                    controller: cubit.passwordCtr,
                                    hintText: 'password'),
                                  verticalChatSizedBox(20),
                                ],
                              ),
                        ChatElevButton(
                          bgColor: greenColor,
                          child: ChatTextWidget(
                            text: cubit.isChecked ? 'Login' : 'Register',
                          ),
                          onPressed: () {
                            cubit.isChecked
                                ? cubit.userLogin()
                                : cubit.userRegistrtion();
                          },
                        ),
                        verticalChatSizedBox(15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ChatTextWidget(
                                text: cubit.isChecked
                                    ? "Don't have an account ?"
                                    : 'All ready have an account'),
                            ChatTextButton(
                              onPressed: () {
                                cubit.isCheckAuth();
                              },
                              text: cubit.isChecked ?  'Register':'Login',
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )),
    );
  }
}
