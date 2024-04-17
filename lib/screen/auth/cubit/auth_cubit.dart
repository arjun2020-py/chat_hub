import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../chat/screen_chat.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.context) : super(AuthInitial());
  BuildContext context;
  bool isChecked = true;
  TextEditingController emailCtr = TextEditingController(),
      usernameCtr = TextEditingController(),
      passwordCtr = TextEditingController();
  isCheckAuth() {
    isChecked = !isChecked;
    emit(AuthInitial());
  }

  

  userLogin() async {
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailCtr.text.trim(), password: passwordCtr.text.trim())
          .then((value) =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => ScreenChat(),
              )));
    } catch (e) {}
  }

  userRegistrtion() async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailCtr.text.trim(), password: passwordCtr.text.trim())
          .then((value) =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => ScreenChat(),
              )));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
