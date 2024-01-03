// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StatusTextWidget extends StatelessWidget {
  StatusTextWidget({
    Key? key,
    required this.label,
    this.fontsize,
  }) : super(key: key);

  final String label;
  double? fontsize = 10.sp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: fontsize,
            fontFamily: 'Nunito Sans',
            fontWeight: FontWeight.w500,
          ),
          softWrap: true,
        ),
        SizedBox(
          height: 0.2.h,
        ),
      ],
    );
  }
}
