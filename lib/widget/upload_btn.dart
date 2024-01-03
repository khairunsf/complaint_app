// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:complaint_app/widget/alert_dialog.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'main_text.dart';

class UploadBtnWidget extends StatefulWidget {
  UploadBtnWidget({
    Key? key,
    required this.label,
    required this.onImagesSelected,
  }) : super(key: key);

  String label;
  Function(List<File>) onImagesSelected;

  @override
  State<UploadBtnWidget> createState() => _UploadBtnWidgetState();
}

class _UploadBtnWidgetState extends State<UploadBtnWidget> {
  List<File> images = [];
  int maxImageLimit = 5;

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> imagesPicked = await picker.pickMultiImage(
      imageQuality: 80,
    );

    if (imagesPicked.length + images.length > maxImageLimit) {
      print('Exceeded image limit');
      showErrorDialog(context, 'limitError'.tr());
      return;
    }

    setState(() {
      images.addAll(imagesPicked.map((image) => File(image.path)).toList());
    });

    widget.onImagesSelected(images);
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
        GestureDetector(
          onTap: () {
            getImage();
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(6, 0, 6, 6),
            padding: EdgeInsets.only(
                left: 4.w, right: 4.w, top: 0.5.h, bottom: 0.5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(242, 242, 242, 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: MainTextWidget(
                    label: 'muatNaikGambar'.tr(),
                    fontsize: 10.sp,
                    fontcolor: Color.fromRGBO(68, 64, 64, 1),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Icon(
                    Iconsax.export_1,
                    size: 20,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
        images.isNotEmpty
            ? Container(
                height: 15.h,
                margin: EdgeInsets.fromLTRB(6, 0, 6, 6),
                padding: EdgeInsets.only(
                    left: 4.w, right: 4.w, top: 0.5.h, bottom: 0.5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(242, 242, 242, 1),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(images.length, (index) {
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: Image.file(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  })),
                ),
              )
            : Container(),
      ],
    );
  }
}
