// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class LogoTextWidget extends StatelessWidget {
   LogoTextWidget(
      {Key? key,
      required this.label,
      this.style = const TextStyle(),
      required this.fontSize,
      this.textColor,
      this.strokeColor,
      this.strokeWidth,
      this.fontWeight = FontWeight.bold})
      : super(key: key);

  final String label;
  final TextStyle style;
  final double fontSize;
  final Color? textColor;
  final Color? strokeColor;
  final double? strokeWidth;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          label,
          style: style.copyWith(
            fontWeight: fontWeight,
            fontSize: fontSize,
              foreground: Paint()
                ..strokeWidth = 2
                ..color = Colors.black
                ..style = PaintingStyle.stroke),
        ),
        Text(
          label,
          style: style.copyWith(
            fontWeight: fontWeight,
            fontSize: fontSize,
              foreground: Paint()
                ..color = Color.fromARGB(255, 254, 254, 254)
                ..style = PaintingStyle.fill),
        ),
      ],
    );
  }
}
