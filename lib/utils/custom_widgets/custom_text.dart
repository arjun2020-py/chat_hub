import 'package:flutter/material.dart';


class ChatTextWidget extends StatelessWidget {
   ChatTextWidget({super.key,required this.text,this.color,this.fontSize,this.fontWeight});
  final String text;
  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color:color,fontSize:fontSize,fontWeight:fontWeight),);
  }
}
