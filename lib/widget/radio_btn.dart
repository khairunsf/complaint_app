// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'main_text.dart';

class RadioBtnWidget extends StatefulWidget {
  RadioBtnWidget({
    Key? key,
    required this.label,
    required this.choice1,
    required this.choice2,
    required this.data,
    required this.onDataSelected
  }) : super(key: key);

  final String label;
  final String choice1;
  final String choice2;
  final String data;
  final void Function(String) onDataSelected;

  @override
  State<RadioBtnWidget> createState() => _RadioBtnWidgetState();
}

class _RadioBtnWidgetState extends State<RadioBtnWidget> {
  int _value = 0;
  String? data;

  void getDataValue(String data) {
    if (data == 'Lelaki') {
      setState(() {
        _value = 1;
      });
    } else if (data == 'Perempuan') {
      setState(() {
        _value = 2;
      });
    } else if (data == 'Malaysia') {
      setState(() {
        _value = 1;
      });
    } else if (data == 'Foreigner') {
      setState(() {
        _value = 2;
      });
    }
    print(data);
  }

  @override
  void initState() {
    super.initState();
    getDataValue(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: MainTextWidget(
            label: widget.label,
            fontsize: 12.sp,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 1.w),
              child: Radio(
                value: 1,
                groupValue: _value,
                onChanged: ((value) {
                  setState(() {
                    _value = value as int;
                    if (widget.label == 'jantina'.tr()) {
                      data = 'Lelaki';
                    } else if (widget.label == 'warganegara'.tr()) {
                      data = widget.choice1;
                    }
                    widget.onDataSelected(data!);
                  });
                }),
                fillColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(169, 168, 168, 1)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: MainTextWidget(
                label: widget.choice1,
                fontcolor: const Color.fromRGBO(68, 64, 64, 1),
                fontsize: 10.sp,
              ),
            ),
            SizedBox(
              width: 1.w,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Radio(
                value: 2,
                groupValue: _value,
                onChanged: ((value) {
                  setState(() {
                    _value = value as int;
                    if (widget.label == 'jantina'.tr()) {
                      data = 'Perempuan';
                    } else if (widget.label == 'warganegara'.tr()) {
                      data = 'Foreigner';
                    }
                    widget.onDataSelected(data!);
                  });
                }),
                fillColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(169, 168, 168, 1)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: MainTextWidget(
                label: widget.choice2,
                fontcolor: const Color.fromRGBO(68, 64, 64, 1),
                fontsize: 10.sp,
              ),
            ),
          ],
        ),
        Text(
          data ?? '',
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
