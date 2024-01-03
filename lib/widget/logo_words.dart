// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:complaint_app/services/assets_image.dart';
import 'package:complaint_app/widget/logo_text.dart';
import 'package:complaint_app/widget/logo_text2.dart';
import 'package:complaint_app/widget/logo_text3.dart';
import 'package:sizer/sizer.dart';

class LogoWordsWidget extends StatelessWidget {
  const LogoWordsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 3.h,
        ),
        ClipOval(
          child: Image.asset(
            AssetsManager.appLogo,
            fit: BoxFit.cover,
            height: 150,
            width: 150,
          ),
        ),

        LogoTextWidget(
          label: " MyComplaint ",
          fontSize: 30.sp,
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          margin: EdgeInsets.only(
            left: 40,
            right: 40,
          ),
          child: LogoText2Widget(label: 'Ready to Help'),
        ),
        SizedBox(
          height: 6,
        ),
        // Container(
        //   margin: EdgeInsets.only(
        //     left: 40,
        //     right: 40,
        //   ),
        //   child: LogoText2Widget(label: 'GOVERNANS NEGERI SABAH'),
        // ),
        // SizedBox(
        //   height: 6,
        // ),
        // Container(
        //   margin: EdgeInsets.only(
        //     left: 40,
        //     right: 40,
        //   ),
        //   child: LogoText2Widget(label: 'PEJABAT SETIAUSAHA KERAJAAN NEGERI'),
        // ),
        // SizedBox(
        //   height: 1.h,
        // ),
        // LogoText3Widget(label: '"Melestarikan Budaya Integriti"'),
      ],
    );
  }
}
