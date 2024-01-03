// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'main_text.dart';

class DropDownBtn extends StatelessWidget {
  DropDownBtn({
    Key? key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hintText,
  }) : super(key: key);

  final String? value;
  final List<DropdownMenuItem<String>>? items;
  final void Function(String?)? onChanged;
  final String label;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: MainTextWidget(
            label: label,
            fontsize: 12.sp,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(6, 0, 6, 6),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(242, 242, 242, 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              icon: Icon(
                Iconsax.arrow_down5,
                color: Color.fromRGBO(68, 64, 64, 1),
              ),
              iconSize: 20,
              hint: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: MainTextWidget(
                  label: hintText ?? 'silaPilih'.tr(),
                  fontcolor: Color.fromRGBO(68, 64, 64, 1),
                  fontsize: 10.sp,
                ),
              ),
              value: value,
              items: items,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
