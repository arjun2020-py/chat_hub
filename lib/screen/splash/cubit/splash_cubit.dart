import 'package:bloc/bloc.dart';
import 'package:chat_hub/screen/chat/view/screen_chat.dart';
import 'package:chat_hub/utils/local_storage/local_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../utils/const.dart';
import '../../../utils/enum.dart';
import '../../auth/view/screen_auth.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.context) : super(SplashInitial()) {
    currentUser().then((userId) {
      authStatus =
          userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
    });
    splash();
  }
  BuildContext context;
  AuthStatus authStatus = AuthStatus.notSignedIn;
  Future<String> currentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user!.uid;
  }

  splash() async {
    senderEmail = await LocalStorage().getStringPrf();
    print('sender email :${senderEmail}');
    Future.delayed(Duration(seconds: 3), () {
      switch (authStatus) {
        case AuthStatus.notSignedIn:
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => ScreenAuth(),
          ));

          break;
        case AuthStatus.signedIn:
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => ScreenChat(
              senderEmail: senderEmail!,
            ),
          ));
          break;
        default:
      }
    });
  }
}
