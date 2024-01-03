// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, duplicate_ignore, unused_field

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:complaint_app/controller/userController.dart';
import 'package:complaint_app/model/userModel.dart';
import 'package:complaint_app/widget/date_textfield.dart';
import 'package:complaint_app/widget/dropdown_btn.dart';
import 'package:complaint_app/widget/radio_btn.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../widget/main_textfield.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String? selected_bangsa;
  String? selected_negeri;
  String? selected_bandar;
  final _formKey = GlobalKey<FormState>();
  final namaCont = TextEditingController();
  final noICCont = TextEditingController();
  final noTelCont = TextEditingController();
  final emelCont = TextEditingController();
  final pekerjaanCont = TextEditingController();
  final alamatCont = TextEditingController();
  final poskodCont = TextEditingController();
  final dateCont = TextEditingController();
  String? jantinaCont;
  String? warganegaraCont;
  final firebaseController = UserController();
  UserModel? user;
  bool isLoading = true;

  void fetchData() async {
    user = (await firebaseController.fetchUser('User'))!;
    print('Name: ${user!.nama}');
    print('Emel: ${user!.emel}');
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  final bangsa = [
    'Kadazan',
    'Brunei',
    'Sungai',
  ];

  final negeri = [
    'Sabah',
    'Pahang',
    'Sarawak',
  ];

  final bandar = [
    'Kota Kinabalu',
    'Kuantan',
    'Kuching',
  ];

  DropdownMenuItem<String> buildBangsa(String bangsa) => DropdownMenuItem(
        value: bangsa,
        child: Text(
          bangsa,
          style: TextStyle(
            fontFamily: 'Nunito Sans',
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(68, 64, 64, 1),
          ),
        ),
      );

  DropdownMenuItem<String> buildNegeri(String negeri) => DropdownMenuItem(
        value: negeri,
        child: Text(
          negeri,
          style: TextStyle(
            fontFamily: 'Nunito Sans',
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(68, 64, 64, 1),
          ),
        ),
      );

  DropdownMenuItem<String> buildBandar(String bandar) => DropdownMenuItem(
        value: bandar,
        child: Text(
          bandar,
          style: TextStyle(
            fontFamily: 'Nunito Sans',
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(68, 64, 64, 1),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 16.0),
            Text(
              'Loading...',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
      );
    }
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
            "profil".tr(),
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
                  MainTextfieldWidget(
                    label: 'namaPenuh'.tr(),
                    controller: namaCont,
                    hintText: '${user?.nama}',
                  ),
                  MainTextfieldWidget(
                    label: 'noIC'.tr(),
                    controller: noICCont,
                    hintText: '${user?.ic}',
                  ),
                  MainTextfieldWidget(
                    label: 'noTelefon'.tr(),
                    controller: noTelCont,
                    hintText: '${user?.noPhone}',
                  ),
                  MainTextfieldWidget(
                    label: 'emel'.tr(),
                    controller: emelCont,
                    hintText: '${user?.emel}',
                  ),
                  RadioBtnWidget(
                    label: 'jantina'.tr(),
                    choice1: 'lelaki'.tr(),
                    choice2: 'perempuan'.tr(),
                    data: '${user?.jantina}',
                    onDataSelected: (selectedData) {
                      jantinaCont = selectedData;
                    },
                  ),
                  DateTextfieldWidget(
                    label: 'tarikhLahir'.tr(),
                    controller: dateCont,
                    hintText: '${user?.dobirth}',
                  ),
                  MainTextfieldWidget(
                    label: 'pekerjaan'.tr(),
                    controller: pekerjaanCont,
                    hintText: '${user?.pekerjaan}',
                  ),
                  RadioBtnWidget(
                    label: 'warganegara'.tr(),
                    choice1: 'Malaysia',
                    choice2: 'antarabangsa'.tr(),
                    data: '${user?.warganegara}',
                    onDataSelected: (selectedData) {
                      warganegaraCont = selectedData;
                    },
                  ),
                  DropDownBtn(
                    hintText: '${user?.bangsa}',
                    label: 'bangsa'.tr(),
                    value: selected_bangsa,
                    items: bangsa.map(buildBangsa).toList(),
                    onChanged: (selectedBangsa) =>
                        setState(() => selected_bangsa = selectedBangsa),
                  ),
                  MainTextfieldWidget(
                    label: 'alamat'.tr(),
                    controller: alamatCont,
                    hintText: '${user?.alamat}',
                  ),
                  DropDownBtn(
                    hintText: '${user?.negeri}',
                    label: 'negeri'.tr(),
                    value: selected_negeri,
                    items: negeri.map(buildNegeri).toList(),
                    onChanged: (selectedNegeri) =>
                        setState(() => selected_negeri = selectedNegeri),
                  ),
                  DropDownBtn(
                    hintText: '${user?.bandar}',
                    label: 'bandar'.tr(),
                    value: selected_bandar,
                    items: bandar.map(buildBandar).toList(),
                    onChanged: (selectedBandar) =>
                        setState(() => selected_bandar = selectedBandar),
                  ),
                  MainTextfieldWidget(
                    label: 'poskod'.tr(),
                    controller: poskodCont,
                    hintText: '${user?.poskod}',
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                fixedSize: MaterialStateProperty.all(
                                    Size(22.w, 4.6.h)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(40, 134, 221, 1)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        side: BorderSide(
                                            color: Color.fromRGBO(40, 134, 221, 1))))),
                            onPressed: () {
                              final userData = UserModel(
                                nama: namaCont.text.trim() != ''
                                    ? namaCont.text.trim()
                                    : user?.nama,
                                ic: noICCont.text.trim() != ''
                                    ? noICCont.text.trim()
                                    : user?.ic,
                                noPhone: noTelCont.text.trim() != ''
                                    ? noTelCont.text.trim()
                                    : user?.noPhone,
                                emel: emelCont.text.trim() != ''
                                    ? emelCont.text.trim()
                                    : user?.emel,
                                jantina: jantinaCont != null
                                    ? jantinaCont
                                    : user?.jantina,
                                dobirth: dateCont.text.trim() != ''
                                    ? dateCont.text.trim()
                                    : user?.dobirth,
                                pekerjaan: pekerjaanCont.text.trim() != ''
                                    ? pekerjaanCont.text.trim()
                                    : user?.pekerjaan,
                                warganegara: warganegaraCont != null
                                    ? warganegaraCont
                                    : user?.warganegara,
                                bangsa: selected_bangsa != null
                                    ? selected_bangsa
                                    : user?.bangsa,
                                alamat: alamatCont.text.trim() != ''
                                    ? alamatCont.text.trim()
                                    : user?.alamat,
                                negeri: selected_negeri != null
                                    ? selected_negeri
                                    : user?.negeri,
                                bandar: selected_bandar != null
                                    ? selected_bandar
                                    : user?.bandar,
                                poskod: poskodCont.text.trim() != ''
                                    ? poskodCont.text.trim()
                                    : user?.poskod,
                                pwd: user?.pwd,
                                confirmPwd: user?.confirmPwd,
                                uid: user?.uid,
                                dateTime: user?.dateTime,
                              );
                              UserController().updateUser(context, userData);
                            },
                            child: Text("simpanCap".tr(), style: TextStyle(fontSize: 10.sp))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
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
