// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainTextWidget extends StatelessWidget {
  MainTextWidget({
    Key? key,
     this.label,
    this.fontsize,
    this.fontcolor,
  }) : super(key: key);

  final String? label;
  double? fontsize = 12.sp;
  Color? fontcolor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label!,
          style: TextStyle(
            fontSize: fontsize,
            fontFamily: 'Nunito Sans',
            fontWeight: FontWeight.w500,
            color: fontcolor,
          ),
          softWrap: true,
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}
