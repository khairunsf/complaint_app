// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LogoText3Widget extends StatelessWidget {
   LogoText3Widget(
      {Key? key,
      required this.label,
      this.color,
      this.fontWeight})
      : super(key: key);

  final String label;
  final double fontSize = 10.sp;
  final Color? color;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.center,
      softWrap: true,
      style: TextStyle(
        fontFamily: 'Nunito',
        color: Color.fromARGB(255, 140, 150, 242),
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
