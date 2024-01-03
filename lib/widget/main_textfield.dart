// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'main_text.dart';

class MainTextfieldWidget extends StatelessWidget {
  MainTextfieldWidget({
    Key? key,
    required this.label,
    required this.controller,
    // required this.validator,
    this.obscureText,
    this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  // final String? Function(String?)? validator;
  final bool? obscureText;
  final String? hintText;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: MainTextWidget(
            label: label,
            fontsize: 12.sp,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(6, 0, 6, 6),
          padding: EdgeInsets.only(left: 4.w, right: 4.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromRGBO(242, 242, 242, 1),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
            ),
            controller: controller,
            obscureText: false,
            // validator: validator,
          ),
        ),
      ],
    );
  }
}
