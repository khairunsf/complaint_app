// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../services/assets_image.dart';
import 'logo_text.dart';
import 'logo_text3.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      toolbarHeight: 21.h,
      // title: Text("Custom App Bar"),
      centerTitle: true,
      flexibleSpace: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/complaint_bg_small.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(80),
              bottomRight: Radius.circular(80)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 4.w,
                ),
                ClipOval(
                  child: Image.asset(
                    AssetsManager.appLogo,
                    height: 7.h,
                    width: 16.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 1.h,
                ),
                LogoTextWidget(
                  label: 'MyComplaint',
                  fontSize: 20.sp,
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 4.h,
                ),
                Text(
                  'salam',
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  softWrap: true,
                  style: TextStyle(
                    fontFamily: 'Nunito Sans',
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    // backgroundColor: Colors.black26,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 4.h,
                ),
                Text(
                  'Name',
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  softWrap: true,
                  style: TextStyle(
                    fontFamily: 'Nunito Sans',
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    // backgroundColor: Colors.black26,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            LogoText3Widget(label: '"We are ready to solve any issue"'),
          ],
        ),
      ),
    );
  }
}
