import 'package:flutter/material.dart';

class TextStyleWidget extends StatelessWidget {
  const TextStyleWidget({Key? key,
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
      softWrap: true,
      style: TextStyle(
        fontFamily: 'Nunito Sans',
        color: Colors.black,
        fontSize: fontSize,
        fontWeight: fontWeight,
        // backgroundColor: Colors.black26,
      ),
    );
  }
}