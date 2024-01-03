// ignore_for_file: prefer_const_constructors, sort_child_properties_last
//login & register & forgot pwd button//
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Button1Widget extends StatelessWidget {
  const Button1Widget({
    Key? key,
    required this.hintText,
    required this.onPressed,
    this.fontSize,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  final String hintText;
  final double? fontSize;
  final Function()? onPressed;
  final MaterialStateProperty<Color?>? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        hintText,
        style: TextStyle(
            fontSize: 13.sp,
            fontFamily: 'Nunito Sans',
            color: textColor,
            fontWeight: FontWeight.w600),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 34.w)),
        backgroundColor: backgroundColor,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
