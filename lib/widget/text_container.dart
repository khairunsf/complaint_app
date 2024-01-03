// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'main_text.dart';

class TextContainerWidget extends StatelessWidget {
  TextContainerWidget({
    Key? key,
    required this.label,
    required this.data,
  }) : super(key: key);

  String label;
  final String data;

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
          width: double.maxFinite,
          margin: const EdgeInsets.fromLTRB(6, 0, 6, 6),
          padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 1.5.h, bottom: 1.5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromRGBO(242, 242, 242, 1),
          ),
          child: Text(
            data,
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: 'Nunito Sans',
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(68, 64, 64, 1),
            ),
            softWrap: true,
            maxLines: 4,
          ),
        ),
        SizedBox(height: 0.5.h,),
      ],
    );
  }
}
