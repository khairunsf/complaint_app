// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StatusBoxWidget extends StatelessWidget {
  StatusBoxWidget({
    Key? key,
    required this.status,
    this.containerColor,
  }) : super(key: key);

  String status;
  Color? containerColor;

  var status1 = 'selesai'.tr(); 
  var status2 = 'dalamSiasatan'.tr();
  var status3 = 'dalamPenilaian'.tr();
  var status4 = 'dalamSemakan'.tr();
  var status5 = 'belumDisemak'.tr();
  var status6 = 'completed'.tr();
  var status7 = 'investigating'.tr();
  var status8 = 'assessing'.tr();
  var status9 = 'reviewing'.tr();
  var status0 = 'unreviewed'.tr();

  @override
  Widget build(BuildContext context) {
    if (status.contains(status1)) {
      containerColor = Color.fromRGBO(47, 171, 68, 1);
      // status = status6;
    } else if (status == status2) {
      containerColor = Color.fromRGBO(89, 136, 227, 1);
      // status = status7;
    } else if (status == status3) {
      containerColor = Color.fromRGBO(255, 119, 21, 1);
      // status = status8;
    } else if (status == status4) {
      containerColor = Color.fromRGBO(252, 176, 0, 1);
      // status = status9;
    } else if (status == status5) {
      containerColor = Color.fromRGBO(227, 89, 89, 1);
      // status = status0;
    } else if (status == status6) {
      containerColor = Color.fromRGBO(47, 171, 68, 1);
      status = status1;
    } else if (status == status7) {
      containerColor = Color.fromRGBO(89, 136, 227, 1);
      status = status2;
    } else if (status == status8) {
      containerColor = Color.fromRGBO(255, 119, 21, 1);
      status = status3;
    } else if (status == status9) {
      containerColor = Color.fromRGBO(252, 176, 0, 1);
      status = status4;
    } else if (status == status0) {
      containerColor = Color.fromRGBO(227, 89, 89, 1);
      status = status5;
    } else {
      containerColor = Color.fromRGBO(227, 89, 89, 1);
    }

    return Container(
      alignment: Alignment.center,
      width: 30.w,
      padding: EdgeInsets.fromLTRB(2.w, 1.h, 2.w, 1.h),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(color: Colors.white, fontSize: 10.sp),
      ),
    );
  }
}
