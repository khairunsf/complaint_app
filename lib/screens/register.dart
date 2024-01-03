// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:complaint_app/controller/userController.dart';
import 'package:complaint_app/model/userModel.dart';
import 'package:complaint_app/widget/background.dart';
import 'package:complaint_app/widget/button1.dart';
import 'package:complaint_app/widget/logo_words.dart';
import 'package:complaint_app/widget/textfield.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    Key? key,
    required this.showLoginPage,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = new GlobalKey<FormState>();
  final nameCont = TextEditingController();
  final icCont = TextEditingController();
  final phoneCont = TextEditingController();
  final emelCont = TextEditingController();
  final pwdCont = TextEditingController();
  final conPwdCont = TextEditingController();
  final fontSize = 10.sp;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackgroundImgWidget(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            margin: EdgeInsets.all(10),
            height: 100.h,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              reverse: false,
              padding: EdgeInsets.only(bottom: 5.h),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LogoWordsWidget(),
                        SizedBox(
                          height: 2.h,
                        ),
                        Textfield1Widget(
                            hintText: 'namaPenuh'.tr(),
                            controller: nameCont,
                            obscureText: false,
                            icon: Icon(Iconsax.profile_circle)),
                        Textfield1Widget(
                            hintText: 'noIC'.tr(),
                            controller: icCont,
                            obscureText: false,
                            icon: Icon(Iconsax.personalcard)),
                        Textfield1Widget(
                            hintText: 'noTelefon'.tr(),
                            controller: phoneCont,
                            obscureText: false,
                            icon: Icon(Iconsax.call)),
                        Textfield1Widget(
                            hintText: 'emel'.tr(),
                            controller: emelCont,
                            obscureText: false,
                            icon: Icon(Iconsax.sms)),
                        Textfield1Widget(
                            hintText: 'kataLaluan'.tr(),
                            controller: pwdCont,
                            obscureText: true,
                            icon: Icon(Iconsax.key)),
                        Textfield1Widget(
                            hintText: 'ulangKataLaluan'.tr(),
                            controller: conPwdCont,
                            obscureText: true,
                            icon: Icon(Iconsax.key_square)),
                        SizedBox(
                          height: 1.h,
                        ),
                        Button1Widget(
                            hintText: 'daftarCap'.tr(),
                            textColor: Colors.black,
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(185, 186, 202, 0.612)),
                            onPressed: () {
                              final user = UserModel(
                                nama: nameCont.text.trim(),
                                ic: icCont.text.trim(),
                                noPhone: phoneCont.text.trim(),
                                emel: emelCont.text.trim(),
                                pwd: pwdCont.text.trim(),
                                confirmPwd: conPwdCont.text.trim(),
                              );
                              UserController().register(context, user);
                            }),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('telahDaftar'.tr(),
                                style: TextStyle(
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                            SizedBox(
                              width: 1.w,
                            ),
                            GestureDetector(
                              onTap: widget.showLoginPage,
                              child: Text(
                                'logMasuk'.tr(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
