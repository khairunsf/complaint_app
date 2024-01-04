// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, non_constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:complaint_app/widget/images_widget.dart';
import 'package:complaint_app/widget/main_text.dart';
import 'package:complaint_app/widget/status_details.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class ComplainDetailsPage extends StatelessWidget {
  ComplainDetailsPage({
    Key? key,
    required this.tajuk,
    required this.status,
    required this.date,
    required this.no_rujukan,
    required this.cawangan_diadu,
    required this.bahagian_diadu,
    required this.butir_aduan,
    required this.lokasi,
    required this.lat,
    required this.long,
    required this.aduanId,
  }) : super(key: key);

  String tajuk;
  String status;
  String date;
  String no_rujukan;
  String cawangan_diadu;
  String bahagian_diadu;
  String butir_aduan;
  String lokasi;
  String lat;
  String long;
  String aduanId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(61, 57, 57, 1),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Iconsax.arrow_square_left),
            iconSize: 3.h,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 15.h,
          title: Text(
            tajuk,
            style: TextStyle(fontSize: 22.sp),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(80), topRight: Radius.circular(80)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      MainTextWidget(label: 'noRujukan'.tr()),
                      SizedBox(
                        width: 1.w,
                      ),
                      MainTextWidget(label: no_rujukan),
                    ],
                  ),
                  Row(
                    children: [
                      MainTextWidget(label: 'cawanganDiadu'.tr()),
                      SizedBox(
                        width: 1.w,
                      ),
                      MainTextWidget(label: cawangan_diadu),
                    ],
                  ),
                  Row(
                    children: [
                      MainTextWidget(label: 'bahagianDiadu'.tr()),
                      SizedBox(
                        width: 1.w,
                      ),
                      MainTextWidget(label: bahagian_diadu),
                    ],
                  ),
                  MainTextWidget(label: 'lampiran'.tr()),
                  ImageListWidget(aduanId: aduanId),
                  SizedBox(
                    height: 1.h,
                  ),
                  MainTextWidget(label: 'butirAduan'.tr()),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    width: 75.w, // Adjust the width as needed
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: butir_aduan,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 6.h,
                    width: double.infinity,
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                    child: MainTextWidget(
                      label: 'Status',
                      fontsize: 14.sp,
                    ),
                  ),
                  Container(
                    height: 40.h,
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StatusDetailsWidget(
                              status: status,
                              date: date,
                              no_rujukan: no_rujukan)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
