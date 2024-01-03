// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import 'main_text.dart';

class DateTextfieldWidget extends StatefulWidget {
  DateTextfieldWidget({
    Key? key,
    required this.label,
    required this.controller,
    required this.hintText,
    // required this.value,
    // required this.items,
    // required this.onChanged,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final String hintText;

  @override
  State<DateTextfieldWidget> createState() => _DateTextfieldWidgetState();
}

class _DateTextfieldWidgetState extends State<DateTextfieldWidget> {
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");

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
        Container(
          margin: EdgeInsets.fromLTRB(6, 0, 6, 6),
          padding: EdgeInsets.only(left: 2.w, right: 4.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromRGBO(242, 242, 242, 1),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: Color.fromRGBO(68, 64, 64, 1),
                fontSize: 10.sp,
              ),
              border: InputBorder.none,
              prefixIcon: Icon(
                Iconsax.calendar_1,
                size: 20,
                color: Colors.black,
              ),
            ),
            controller: widget.controller,
            validator: (value) {
              if (value == "") {
                return "Please Select Date of Birth";
              }
              return null;
            },
            onTap: (() async {
              DateTime? pickeddate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1700),
                  lastDate: DateTime(2101));
              if (pickeddate != null) {
                setState(() {
                  widget.controller.text = dateFormat.format(pickeddate);
                });
              }
            }),
          ),
        ),
      ],
    );
  }
}
