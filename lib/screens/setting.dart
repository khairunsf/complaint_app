// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:complaint_app/controller/userController.dart';
import 'package:complaint_app/model/userModel.dart';
import 'package:complaint_app/screens/tukar_kata_laluan.dart';
import 'package:complaint_app/widget/alert_dialog.dart';
import 'package:complaint_app/widget/main_text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../services/assets_image.dart';
import '../widget/logo_text.dart';
import '../widget/logo_text3.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isSwitch = true;
  bool isLoading = true;
  final firebaseController = UserController();
  UserModel? user;

  void fetchData() async {
    user = (await firebaseController.fetchUser('User'))!;

    print('Name: ${user!.nama}');
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadSwitchState();
    fetchData();
  }

  void _loadSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isSwitch = prefs.getBool('switchState') ?? true;
    });
  }

  void _onSwitchChanged(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isSwitch = newValue;
      if (isSwitch) {
        context.setLocale(Locale('ms', 'MY'));
      } else {
        context.setLocale(Locale('en', 'US'));
      }
      prefs.setBool('switchState', newValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 16.0),
            Text(
              'Loading...',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 21.h,
          // title: Text("Custom App Bar"),
          centerTitle: true,
          flexibleSpace: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/complaint_bg_small.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80)),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 4.w,
                    ),
                    ClipOval(
                  child: Image.asset(
                    AssetsManager.appLogo,
                    height: 7.h,
                    width: 16.w,
                    fit: BoxFit.cover,
                  ),
                ),
                    SizedBox(
                      width: 1.h,
                    ),
                    LogoTextWidget(
                      label: 'MyComplaint',
                      fontSize: 20.sp,
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 4.h,
                    ),
                    Text(
                      'salam'.tr(),
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      softWrap: true,
                      style: TextStyle(
                        fontFamily: 'Nunito Sans',
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        // backgroundColor: Colors.black26,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 4.h,
                    ),
                    Text(
                      '${user?.nama}',
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      softWrap: true,
                      style: TextStyle(
                        fontFamily: 'Nunito Sans',
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        // backgroundColor: Colors.black26,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                LogoText3Widget(label: '"We are ready to solve any issue"'),
              ],
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MainTextWidget(
                  label: 'tetapan'.tr(),
                  fontsize: 30.sp,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MainTextWidget(
                      label: 'bahasa'.tr(),
                      fontsize: 15.sp,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    FlutterSwitch(
                      activeColor: const Color.fromRGBO(61, 57, 57, 1),
                      inactiveColor: const Color.fromRGBO(217, 217, 217, 1),
                      activeToggleColor: const Color.fromRGBO(217, 217, 217, 1),
                      inactiveToggleColor: const Color.fromRGBO(61, 57, 57, 1),
                      activeTextColor: const Color.fromRGBO(255, 255, 255, 1),
                      inactiveTextColor: const Color.fromRGBO(61, 57, 57, 1),
                      height: 5.h,
                      width: 22.w,
                      toggleSize: 20,
                      padding: 9,
                      borderRadius: 35,
                      valueFontSize: 12.sp,
                      activeText: ' MY',
                      inactiveText: 'ENG',
                      activeTextFontWeight: FontWeight.w400,
                      inactiveTextFontWeight: FontWeight.w400,
                      showOnOff: true,
                      value: isSwitch,
                      onToggle: _onSwitchChanged,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                ElevatedButton(
                  child: Text(
                    'tukarKataLaluan'.tr(),
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'Nunito Sans',
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        vertical: 1.6.h, horizontal: 10.w)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(61, 57, 57, 1)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TukarKataLaluanPage()));
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
                ElevatedButton.icon(
                  icon: const Icon(Iconsax.logout),
                  label: Text(
                    'logKeluar'.tr(),
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Nunito Sans',
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        vertical: 1.4.h, horizontal: 11.w)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(61, 57, 57, 1)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  onPressed: () {
                    showConfirmationDialog(context, 'logout'.tr());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
