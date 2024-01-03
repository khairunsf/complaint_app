// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:complaint_app/controller/authController.dart';
import 'package:complaint_app/controller/userController.dart';
import 'package:complaint_app/services/auth.dart';
import 'package:complaint_app/widget/alert_dialog.dart';
import 'package:complaint_app/widget/background.dart';
import 'package:complaint_app/widget/button1.dart';
import 'package:complaint_app/widget/logo_text2.dart';
import 'package:complaint_app/widget/logo_words.dart';
import 'package:complaint_app/widget/textfield.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class LupaKataLaluanPage extends StatefulWidget {
  const LupaKataLaluanPage({super.key});

  @override
  State<LupaKataLaluanPage> createState() => _LupaKataLaluanPageState();
}

class _LupaKataLaluanPageState extends State<LupaKataLaluanPage> {
  final _formKey = GlobalKey<FormState>();
  final emelCont = TextEditingController();
  final _authController = AuthController();
  final _userController = UserController();
  final fontSize = 10.sp;

  Future<void> _passwordReset() async {
    try {
      await _authController.sendPasswordResetEmail(emelCont.text.trim());
      showPasswordDialog(
          context, 'Password Reset Link Sent! Please check your email.');
      await Future.delayed(Duration(seconds: 2));
      _userController.navigateToAuthPage(context);
    } on FirebaseAuthException catch (e) {
      showErrorDialog(context, e.message.toString());
    }
  }

  @override
  void dispose() {
    emelCont.dispose();
    super.dispose();
  }

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
            padding: EdgeInsets.only(top: 10.h, bottom: 3.h),
            child: Center(
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LogoWordsWidget(),
                      SizedBox(height: 3.h),
                      LogoText2Widget(
                        label: 'penetapanPwd'.tr(),
                        fontSize: 14.sp,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Textfield1Widget(
                        hintText: 'emel'.tr(),
                        controller: emelCont,
                        obscureText: false,
                        icon: Icon(Iconsax.sms),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Button1Widget(
                          hintText: 'hantarCap'.tr(),
                          textColor: Colors.black,
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(185, 186, 202, 0.612)),
                          onPressed: () {
                            _passwordReset();
                          }),
                      SizedBox(
                        height: 2.h,
                      ),
                      Button1Widget(
                        hintText: 'kembaliCap'.tr(),
                        textColor: Colors.white,
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(118, 129, 170, 0.612)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AuthPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  )),
            ),
          ),
        ),
      )),
    );
  }
}
