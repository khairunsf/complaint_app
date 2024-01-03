// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:complaint_app/controller/userController.dart';
import 'package:complaint_app/model/userModel.dart';
import 'package:complaint_app/widget/alert_dialog.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../widget/textfield2.dart';

class TukarKataLaluanPage extends StatefulWidget {
  const TukarKataLaluanPage({super.key});

  @override
  State<TukarKataLaluanPage> createState() => _TukarKataLaluanPageState();
}

class _TukarKataLaluanPageState extends State<TukarKataLaluanPage> {
  final curPwdCont = TextEditingController();
  final newPwdCont = TextEditingController();
  final conPwdCont = TextEditingController();
  final firebaseController = UserController();
  UserModel? user;
  bool isLoading = true;

  void fetchData() async {
    user = (await firebaseController.fetchUser('User'))!;
    print('Pwd: ${user!.pwd}');
    print('ConPwd: ${user!.confirmPwd}');
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

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
            "tukarKataLaluan".tr(),
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
            padding: const EdgeInsets.fromLTRB(50, 120, 50, 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Textfield2Widget(
                      controller: curPwdCont,
                      hintText: 'kataLaluanSekarang'.tr(),
                      obscureText: true,
                      icon: Icon(Iconsax.lock)),
                  Textfield2Widget(
                      controller: newPwdCont,
                      hintText: 'kataLaluanBaharu'.tr(),
                      obscureText: true,
                      icon: Icon(Iconsax.key)),
                  Textfield2Widget(
                      controller: conPwdCont,
                      hintText: 'ulangKataLaluanBaharu'.tr(),
                      obscureText: true,
                      icon: Icon(Iconsax.key_square)),
                  SizedBox(
                    height: 2.h,
                  ),
                  ElevatedButton(
                    child: Text(
                      'kemaskiniCap'.tr(),
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'Nunito Sans',
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    style: ButtonStyle(
                      alignment: Alignment.center,
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          vertical: 2.h, horizontal: 21.w)),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(40, 134, 221, 1)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (curPwdCont.text.isNotEmpty &&
                          newPwdCont.text.isNotEmpty &&
                          conPwdCont.text.isNotEmpty) {
                        if (curPwdCont.text == user!.pwd) {
                          if (newPwdCont.text == conPwdCont.text) {
                            Map<String, dynamic> fieldsToUpdate = {
                              'Password': newPwdCont.text,
                              'ConfirmPassword': conPwdCont.text,
                              // Update the password field
                            };
                            await firebaseController.updatePwd(
                                context, user!, fieldsToUpdate);
                          } else {
                            showErrorDialog(context,
                                'New password and confirm password did not match. Try again.');
                            // show pwd and conPwd did not match
                          }
                        } else {
                          showErrorDialog(context,
                              'Current Password is not correct. Try again.');
                          // Show a message that current pwd is not correct
                        }
                      } else {
                        showErrorDialog(context, 'The fields cannot be empty.');
                        // Show a message that fields cannot be empty
                      }
                    },
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
