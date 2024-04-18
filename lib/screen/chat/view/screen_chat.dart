import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/custom_color/custom_color.dart';
import '../../../utils/custom_widgets/custom_icon_butt.dart';
import '../../../utils/custom_widgets/custom_text.dart';
import '../cubit/chat_cubit.dart';
import 'screen_chat_details.dart';

class ScreenChat extends StatelessWidget {
  const ScreenChat({super.key, required this.senderEmail});
  final String senderEmail;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(context),
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          var cubit = context.read<ChatCubit>();
          return Scaffold(
              appBar: AppBar(
                backgroundColor: appbarMainColor,
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
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pop();
                      },
                      icon: Icons.logout,
                      iconColor: whiteColor)
                ],
              ),
              body: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('user_collection')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.separated(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data!.docs[index];
                          return InkWell(
                            onTap: () {
                              if (data['email'] == senderEmail) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ScreenChatDetails(
                                    data: data,
                                    senderEmail: senderEmail,
                                  ),
                                ));
                              }
                            },
                            child: ListTile(
                              title: Text(data['username']),
                              subtitle: Text(data['email']),
                              trailing: Text('now'),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            color: blackColor,
                            thickness: 0.1,
                          );
                        },
                      );
                    }
                  }));
        },
      ),
    );
  }
}
