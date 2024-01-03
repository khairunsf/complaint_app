// ignore_for_file: prefer_const_constructors
//login & register & forgot pwd textfield//
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Textfield2Widget extends StatelessWidget {
  const Textfield2Widget({
    Key? key,
    required this.controller,
    // required this.validator,
    required this.hintText,
    this.fontSize,
    required this.obscureText,
    required this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  // final String? Function(String?)? validator;
  final double? fontSize;
  final bool obscureText;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(left: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color.fromRGBO(242, 242, 242, 1),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        // validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: icon,
          iconColor: Color.fromRGBO(68, 64, 64, 1),
          hintText: hintText,
          hintStyle: TextStyle(
              color: Color.fromRGBO(68, 64, 64, 1),
              fontSize: 12.sp,
              fontFamily: 'Nunito Sans'),
        ),
      ),
    );
  }
}
