// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:complaint_app/controller/userController.dart';
import 'package:complaint_app/model/userModel.dart';
import 'package:complaint_app/screens/lupa_kata_laluan.dart';
import 'package:complaint_app/widget/background.dart';
import 'package:complaint_app/widget/button1.dart';
import 'package:complaint_app/widget/logo_words.dart';
import 'package:complaint_app/widget/textfield.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({
    Key? key,
    required this.showRegisterPage,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = new GlobalKey<FormState>();
  final icCont = TextEditingController();
  final pwdCont = TextEditingController();
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
              padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
              reverse: false,
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LogoWordsWidget(),
                        SizedBox(
                          height: 3.h,
                        ),
                        Textfield1Widget(
                          hintText: 'noIC'.tr(),
                          controller: icCont,
                          obscureText: false,
                          icon: Icon(Iconsax.personalcard),
                        ),
                        Textfield1Widget(
                            hintText: 'kataLaluan'.tr(),
                            controller: pwdCont,
                            obscureText: true,
                            icon: Icon(Iconsax.key)),
                        Padding(
                          padding: EdgeInsets.only(left: 60.w),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LupaKataLaluanPage()));
                            },
                            child: Text(
                              'lupaKataLaluan'.tr(),
                              style: TextStyle(
                                fontSize: fontSize,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Button1Widget(
                          hintText: 'logMasukCap'.tr(),
                          textColor: Colors.black,
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(185, 186, 202, 0.612)),
                          onPressed: () {
                            final user = UserModel(
                              ic: icCont.text.trim(),
                              pwd: pwdCont.text.trim(),
                            );
                            UserController().login(context, user);
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('penggunaBaru'.tr(),
                                style: TextStyle(
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                            SizedBox(
                              width: 1.w,
                            ),
                            GestureDetector(
                              onTap: widget.showRegisterPage,
                              child: Text(
                                'daftar'.tr(),
                                style: TextStyle(
                                  fontSize: fontSize,
                                  color: Colors.white,
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
