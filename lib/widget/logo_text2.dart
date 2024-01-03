import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LogoText2Widget extends StatelessWidget {
   const LogoText2Widget(
      {Key? key,
      required this.label,
      this.color,
      this.fontSize,
      this.fontWeight})
      : super(key: key);

  final String label;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.center,
      maxLines: 3,
      softWrap: true,
      style: TextStyle(
        fontFamily: 'Nunito Sans',
        color: Colors.white,
        fontSize: 10.sp,
        fontWeight: FontWeight.w600,
        // backgroundColor: Colors.black26,
      ),
    );
  }
}
