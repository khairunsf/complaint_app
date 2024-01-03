// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, non_constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:complaint_app/widget/status_text.dart';
import 'package:sizer/sizer.dart';
import 'package:timelines/timelines.dart';

class StatusDetailsWidget extends StatelessWidget {
  StatusDetailsWidget({
    Key? key,
    required this.status,
    required this.date,
    required this.no_rujukan,
  }) : super(key: key);

  String status;
  String date;
  String no_rujukan;
  Widget? statusDetails;

  var status1 = 'selesai'.tr();
  var status2 = 'dalamSiasatan'.tr();
  var status3 = 'dalamPenilaian'.tr();
  var status4 = 'dalamSemakan'.tr();
  var status5 = 'belumDisemak'.tr();

  @override
  Widget build(BuildContext context) {
    if (status == status1) {
      statusDetails = Column(
        children: [
          TimelineTile(
            nodeAlign: TimelineNodeAlign.start,
            contents: Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusTextWidget(label: 'dalamSemakan'.tr()),
                  StatusTextWidget(label: 'namaPegawai'.tr()),
                  StatusTextWidget(label: date),
                ],
              ),
            ),
            node: TimelineNode(
              indicator: DotIndicator(
                color: Colors.green,
                size: 2.5.h,
              ),
              endConnector: DashedLineConnector(
                color: Colors.black,
                gap: 3,
                indent: 3,
              ),
              direction: Axis.vertical,
            ),
          ),
          TimelineTile(
            nodeAlign: TimelineNodeAlign.start,
            contents: Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusTextWidget(label: 'dalamPenilaian'.tr()),
                  StatusTextWidget(label: 'namaPegawai'.tr()),
                  StatusTextWidget(label: date),
                ],
              ),
            ),
            node: TimelineNode(
              indicator: DotIndicator(
                color: Colors.green,
                size: 2.5.h,
              ),
              startConnector: DashedLineConnector(
                color: Colors.black,
                gap: 3,
                indent: 3,
                endIndent: 1,
              ),
              endConnector: DashedLineConnector(
                color: Colors.black,
                gap: 3,
                indent: 3,
              ),
              direction: Axis.vertical,
            ),
          ),
          TimelineTile(
            nodeAlign: TimelineNodeAlign.start,
            contents: Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusTextWidget(label: 'lulus'.tr()),
                  StatusTextWidget(label: 'namaPegawai'.tr()),
                  StatusTextWidget(label: date),
                ],
              ),
            ),
            node: TimelineNode(
              indicator: DotIndicator(
                color: Colors.green,
                size: 2.5.h,
              ),
              startConnector: DashedLineConnector(
                color: Colors.black,
                gap: 3,
                indent: 3,
                endIndent: 1,
              ),
              endConnector: DashedLineConnector(
                color: Colors.black,
                gap: 3,
                indent: 3,
              ),
              direction: Axis.vertical,
            ),
          ),
          TimelineTile(
            nodeAlign: TimelineNodeAlign.start,
            contents: Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusTextWidget(label: 'dalamSiasatan'.tr()),
                  StatusTextWidget(label: 'namaPegawai'.tr()),
                  StatusTextWidget(label: date),
                ],
              ),
            ),
            node: TimelineNode(
              indicator: DotIndicator(
                color: Colors.green,
                size: 2.5.h,
              ),
              startConnector: DashedLineConnector(
                color: Colors.black,
                gap: 3,
                indent: 3,
                endIndent: 1,
              ),
              endConnector: DashedLineConnector(
                color: Colors.black,
                gap: 3,
                indent: 3,
              ),
              direction: Axis.vertical,
            ),
          ),
          TimelineTile(
            nodeAlign: TimelineNodeAlign.start,
            contents: Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusTextWidget(label: 'selesai'.tr()),
                  StatusTextWidget(label: date),
                ],
              ),
            ),
            node: TimelineNode(
              indicator: DotIndicator(
                color: Colors.green,
                size: 2.5.h,
              ),
              startConnector: DashedLineConnector(
                color: Colors.black,
                gap: 3,
                indent: 2,
                endIndent: 1,
              ),
              direction: Axis.vertical,
            ),
          ),
        ],
      );
    } else if (status == status2) {
      statusDetails = Column(
        children: [
          TimelineTile(
            nodeAlign: TimelineNodeAlign.start,
            contents: Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusTextWidget(label: 'dalamSemakan'.tr()),
                  StatusTextWidget(label: 'namaPegawai'.tr()),
                  StatusTextWidget(label: date),
                ],
              ),
            ),
            node: TimelineNode(
              indicator: DotIndicator(
                color: Colors.green,
                size: 2.5.h,
              ),
              endConnector: DashedLineConnector(
                color: Colors.black,
                gap: 3,
                indent: 3,
              ),
              direction: Axis.vertical,
            ),
          ),
          TimelineTile(
            nodeAlign: TimelineNodeAlign.start,
            contents: Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusTextWidget(label: 'dalamPenilaian'.tr()),
                  StatusTextWidget(label: 'namaPegawai'.tr()),
                  StatusTextWidget(label: date),
                ],
              ),
            ),
            node: TimelineNode(
              indicator: DotIndicator(
                color: Colors.green,
                size: 2.5.h,
              ),
              startConnector: DashedLineConnector(
                color: Colors.black,
                gap: 3,
                indent: 3,
                endIndent: 2,
              ),
              endConnector: DashedLineConnector(
                color: Colors.black,
                gap: 3,
                indent: 3,
              ),
              direction: Axis.vertical,
            ),
          ),
          TimelineTile(
            nodeAlign: TimelineNodeAlign.start,
            contents: Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusTextWidget(label: 'lulus'.tr()),
                  StatusTextWidget(label: 'namaPegawai'.tr()),
                  StatusTextWidget(label: date),
                ],
              ),
            ),
            node: TimelineNode(
              indicator: DotIndicator(
                color: Colors.green,
                size: 2.5.h,
              ),
              startConnector: DashedLineConnector(
                color: Colors.black,
                gap: 3,
                indent: 3,
                endIndent: 2,
              ),
              endConnector: DashedLineConnector(
                color: Colors.black,
                gap: 3,
                indent: 3,
              ),
              direction: Axis.vertical,
            ),
          ),
          TimelineTile(
            nodeAlign: TimelineNodeAlign.start,
            contents: Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusTextWidget(label: 'dalamSiasatan'.tr()),
                  StatusTextWidget(label: date),
                ],
              ),
            ),
            node: TimelineNode(
              indicator: DotIndicator(
                color: Color.fromRGBO(89, 136, 227, 1),
                size: 2.5.h,
              ),
              startConnector: DashedLineConnector(
                color: Colors.black,
                gap: 3,
                indent: 2,
                endIndent: 2,
              ),
              direction: Axis.vertical,
            ),
          ),
        ],
      );
    } else if (status == status3) {
      statusDetails = Column(
        children: [
          TimelineTile(
            nodeAlign: TimelineNodeAlign.start,
            contents: Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusTextWidget(label: 'dalamSemakan'.tr()),
                  StatusTextWidget(label: 'namaPegawai'.tr()),
                  StatusTextWidget(label: date),
                ],
              ),
            ),
            node: TimelineNode(
              indicator: DotIndicator(
                color: Colors.green,
                size: 2.5.h,
              ),
              endConnector: DashedLineConnector(
                color: Colors.black,
                gap: 3,
                indent: 3,
                endIndent: 2,
              ),
              direction: Axis.vertical,
            ),
          ),
          TimelineTile(
            nodeAlign: TimelineNodeAlign.start,
            contents: Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusTextWidget(label: 'dalamPenilaian'.tr()),
                  StatusTextWidget(label: date),
                ],
              ),
            ),
            node: TimelineNode(
              indicator: DotIndicator(
                color: Color.fromRGBO(255, 119, 21, 1),
                size: 2.5.h,
              ),
              startConnector: DashedLineConnector(
                color: Colors.black,
                gap: 3,
                indent: 1,
              ),
              direction: Axis.vertical,
            ),
          ),
        ],
      );
    } else if (status == status4) {
      statusDetails = TimelineTile(
        nodeAlign: TimelineNodeAlign.start,
        contents: Padding(
          padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusTextWidget(label: 'dalamSemakan'.tr()),
              StatusTextWidget(label: date),
            ],
          ),
        ),
        node: TimelineNode(
          indicator: DotIndicator(
            color: Color.fromRGBO(252, 176, 0, 1),
            size: 2.5.h,
          ),
          endConnector: DashedLineConnector(
            color: Colors.black,
            gap: 3,
            indent: 3,
          ),
          direction: Axis.vertical,
        ),
      );
    } else {
      statusDetails = TimelineTile(
        nodeAlign: TimelineNodeAlign.start,
        contents: Padding(
          padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusTextWidget(label: 'belumDisemak'.tr()),
            ],
          ),
        ),
        node: TimelineNode(
          indicator: DotIndicator(
            color: Color.fromRGBO(227, 89, 89, 1),
            size: 2.5.h,
          ),
          direction: Axis.vertical,
        ),
      );
    }
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: statusDetails,
    );
  }
}
