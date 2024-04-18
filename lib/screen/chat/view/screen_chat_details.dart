import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/custom_color/custom_color.dart';
import '../../../utils/custom_widgets/custom_text.dart';
import '../cubit/chat_cubit.dart';

class ScreenChatDetails extends StatelessWidget {
  const ScreenChatDetails(
      {super.key, required this.data, required this.senderEmail});
  final QueryDocumentSnapshot<Map<String, dynamic>> data;
  final String senderEmail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appbarMainColor,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: whiteColor,
              )),
          title: ChatTextWidget(
            text: data['username'],
            color: whiteColor,
          ),
        ),
        body: BlocProvider(
          create: (context) => ChatCubit(context),
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              var cubit = context.read<ChatCubit>();
              return StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('user_collection')
                      .doc(data.id)
                      .collection('chat_collection')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      cubit.reciverEmail = data['email'];
                      cubit.senderEmail = senderEmail;
                      return Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                var chat = snapshot.data!.docs[index];
                                return InkWell(
                                  onTap: () {
                                    //cubit.deleteMessage(chat.id);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 6, bottom: 6),
                                    child: Align(
                                        alignment:
                                            chat['sender_email'] == senderEmail
                                                ? Alignment.topRight
                                                : Alignment.topLeft,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.08,
                                          decoration: BoxDecoration(
                                              color: chat['sender_email'] ==
                                                      senderEmail
                                                  ? Colors.blue[400]
                                                  : Colors.grey.shade300,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Center(
                                              child:
                                                  Text(chat['sender_content'])),
                                        )),
                                  ),
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 10, bottom: 10, top: 10),
                              height: 60,
                              width: double.infinity,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: cubit.msgCtr,
                                      decoration: InputDecoration(
                                          hintText: "Write message...",
                                          hintStyle:
                                              TextStyle(color: Colors.black54),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      cubit.chatCollection(data.id);
                                    },
                                    child: Icon(
                                      Icons.send,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    backgroundColor: Colors.blue,
                                    elevation: 0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  });
            },
          ),
        ));
  }
}
