import 'package:flutter/material.dart';

class splashComp extends StatelessWidget {
  splashComp({required this.pic,this.text="",this.color=Colors.white});
  String pic;
  String text;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Image.asset('$pic'),

    );
  }
}