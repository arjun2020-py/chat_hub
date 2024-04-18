import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../utils/local_storage/local_storage.dart';
import '../../chat/view/screen_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
       var data = LocalStorage();
      data.setStringPrf(emailCtr.text);
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailCtr.text.trim(), password: passwordCtr.text.trim())
          .then((value) =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => ScreenChat(senderEmail: emailCtr.text,),
              )));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  userRegistrtion() async {
    try {
     
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailCtr.text.trim(), password: passwordCtr.text.trim())
          .then((value) {
        userCollection();
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ScreenChat(senderEmail:emailCtr.text,),
        ));
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  userCollection() async {
    final userPref = await FirebaseFirestore.instance
        .collection('user_collection')
        .add({'email': emailCtr.text.trim()});
    if (emailCtr.text.isNotEmpty &&
        usernameCtr.text.isNotEmpty &&
        passwordCtr.text.isNotEmpty) {
      await userPref.set({
        "email":emailCtr.text.trim(),
        "id": userPref.id,
        'username': usernameCtr.text.trim(),
        'password': passwordCtr.text.trim(),
        'time': DateTime.now()
      });
     
    }
  }
}
