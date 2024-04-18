import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.context) : super(ChatInitial());
  BuildContext context;
  TextEditingController msgCtr = TextEditingController();
  String? senderEmail;
  String? reciverEmail;
  userLogout() async {
    await FirebaseAuth.instance.signOut();
  }

  chatCollection(String id) async {
    FirebaseFirestore.instance
        .collection('user_collection')
        .doc(id)
        .collection('chat_collection')
        .add({
      "sender_content": msgCtr.text.trim(),
      // "reciver_content":'',
      "sender_email": senderEmail,
      "reciver_email": reciverEmail,
      "time": DateTime.now()
    });
    msgCtr.clear();
  }

  // deleteMessage(String id) async {
  //   FirebaseFirestore.instance.collection('chat').doc(id).delete();
    
  // }
}
