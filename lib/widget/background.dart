// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BackgroundImgWidget extends StatelessWidget {
  final Widget child;
  const BackgroundImgWidget({Key? key,
	required this.child,
	}) :super(key:key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/complaint_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      );
}
