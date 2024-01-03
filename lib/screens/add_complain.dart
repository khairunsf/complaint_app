// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_build_context_synchronously, avoid_print, must_be_immutable, unused_field

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:complaint_app/controller/aduanController.dart';
import 'package:complaint_app/widget/dropdown_btn.dart';
import 'package:complaint_app/widget/map_modal.dart';
import 'package:complaint_app/widget/multilines_textfield.dart';
import 'package:complaint_app/widget/upload_btn.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../model/aduanModel.dart';
import '../widget/bottombar.dart';
import '../widget/main_text.dart';
import '../widget/main_textfield.dart';

class ComplainPage extends StatefulWidget {
  const ComplainPage({
    super.key,
  });

  @override
  State<ComplainPage> createState() => _ComplainPageState();
}

class _ComplainPageState extends State<ComplainPage> {
  bool isChecked = false;
  String? selected_jabatan;
  String? selected_daerah;
  final _formKey = GlobalKey<FormState>();
  final tajukCont = TextEditingController();
  final butirCont = TextEditingController();
  final lokasiCont = TextEditingController();
  final latCont = TextEditingController();
  final longCont = TextEditingController();
  String? pengakuan = "Tidak Setuju";
  List<File> selectedImages = [];

  //dropdown btn choices
  final jabatan = [
    'Jabatan 1',
    'Jabatan 2',
    'Jabatan 3',
  ];

  final daerah = [
    'Kota Kinabalu',
    'Lahad Datu',
    'Papar',
  ];

  DropdownMenuItem<String> buildJabatan(String jabatan) => DropdownMenuItem(
        value: jabatan,
        child: Text(
          jabatan,
          style: TextStyle(
            fontFamily: 'Nunito Sans',
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(68, 64, 64, 1),
          ),
        ),
      );

  DropdownMenuItem<String> buildDaerah(String daerah) => DropdownMenuItem(
        value: daerah,
        child: Text(
          daerah,
          style: TextStyle(
            fontFamily: 'Nunito Sans',
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(68, 64, 64, 1),
          ),
        ),
      );

  //to get location
  Position? _currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;
  String _currentAddress = "Loading address...";
  double? lat = 0.00;
  double? long = 0.00;

  // function to check the permission to access the location
  Future<Position> _getCurrentLocation() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      print("Service Disabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }

  //function to geocode the coordinate and convert into address
  _getAddressFromCoordinates() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentLocation!.latitude, _currentLocation!.longitude);
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            "${place.street}, ${place.postalCode}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  void updateLocation(String address, double lat, double long) {
    setState(() {
      _currentAddress = address;
      this.lat = lat;
      this.long = long;
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation().then((position) {
      _currentLocation = position;
      lat = _currentLocation!.latitude;
      long = _currentLocation!.longitude;
      _getAddressFromCoordinates().then((_) {
        setState(() {});
      });
    });
  }

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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BottomBarWidget()));
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 15.h,
          title: Text(
            "aduanBaru".tr(),
            style: TextStyle(fontSize: 22.sp),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
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
                    height: 1.h,
                  ),
                  DropDownBtn(
                    label: 'jabatanDiadu'.tr(),
                    value: selected_jabatan,
                    items: jabatan.map(buildJabatan).toList(),
                    onChanged: (selected_jabatan) => setState(
                        () => this.selected_jabatan = selected_jabatan),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  DropDownBtn(
                    label: 'daerahDiadu'.tr(),
                    value: selected_daerah,
                    items: daerah.map(buildDaerah).toList(),
                    onChanged: (selected_daerah) =>
                        setState(() => this.selected_daerah = selected_daerah),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  MainTextfieldWidget(
                    label: 'tajukAduan'.tr(),
                    controller: tajukCont,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  MultilineTextfieldWidget(
                    label: 'butirAduan'.tr(),
                    controller: butirCont,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  UploadBtnWidget(
                    label: 'lampiran2'.tr(),
                    onImagesSelected: (List<File> images) {
                      setState(() {
                        selectedImages = images;
                      });
                    },
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    padding: EdgeInsets.all(8),
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(215, 92, 92, 1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'maksimum'.tr(),
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'hanya'.tr(),
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'setiap'.tr(),
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: MainTextWidget(
                          label: 'lokasi'.tr(),
                          fontsize: 12.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("$_currentLocation");
                          print(_currentAddress);
                          showModal(context, lat, long, updateLocation);
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
                                  label: 'dapatkanLokasi'.tr(),
                                  fontsize: 10.sp,
                                  fontcolor: Color.fromRGBO(68, 64, 64, 1),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: Icon(
                                  Iconsax.map,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  lat != null
                      ? Container(
                          // height: 20.h,
                          margin: EdgeInsets.fromLTRB(6, 0, 6, 6),
                          padding: EdgeInsets.only(
                              left: 4.w, right: 4.w, top: 1.h, bottom: 0.5.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromRGBO(242, 242, 242, 1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text('_alamat'.tr()),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                _currentAddress,
                                overflow: TextOverflow.visible,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text('lat'.tr()),
                              Text('$lat'),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text('long'.tr()),
                              Text('$long'),
                              SizedBox(
                                height: 1.h,
                              ),
                            ],
                          ),
                        )
                      : Container(
                          height: 6.h,
                          width: 90.h,
                          margin: EdgeInsets.fromLTRB(6, 0, 6, 6),
                          padding: EdgeInsets.only(
                              left: 4.w, right: 4.w, top: 1.h, bottom: 0.5.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromRGBO(242, 242, 242, 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainTextWidget(
                                label: 'nullLokasi'.tr(),
                              ),
                            ],
                          ),
                        ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.grey.shade600.withOpacity(.32);
                          }
                          return Colors.grey.shade600;
                        }),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                            if (isChecked == true) {
                              pengakuan = 'Setuju';
                            }
                          });
                        },
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 12, 0, 10),
                        width: 55.w, // Adjust the width as needed
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
                                text: 'pengakuan'.tr(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 25.w, bottom: 1.h),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 12),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green.shade700),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        side: BorderSide(
                                            color: Colors.green.shade700)))),
                            onPressed: () {
                              final aduan = AduanModel(
                                jabatan: selected_jabatan!,
                                daerah: selected_daerah!,
                                tajuk: tajukCont.text.trim(),
                                butir: butirCont.text.trim(),
                                lokasi: _currentAddress,
                                lat: lat!,
                                long: long!,
                                pengakuan: pengakuan,
                              );
                              createAduan(context, aduan,
                                  images: selectedImages);
                            },
                            child: Text("hantarCap".tr(),
                                style: TextStyle(fontSize: 10.sp))),
                      ),
                    ],
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
