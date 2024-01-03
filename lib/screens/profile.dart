// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, unnecessary_string_interpolations

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:complaint_app/controller/userController.dart';
import 'package:complaint_app/model/userModel.dart';
import 'package:complaint_app/screens/edit_profile.dart';
import 'package:complaint_app/widget/text_container.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import '../widget/bottombar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
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

  void _onRefresh() async {
    fetchData();
    _refreshController.refreshCompleted();
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
            child: SmartRefresher(
              controller: _refreshController,
              onRefresh: _onRefresh,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextContainerWidget(
                      label: 'namaPenuh'.tr(),
                      data: '${user?.nama ?? ''}',
                    ),
                    TextContainerWidget(
                      label: 'noIC'.tr(),
                      data: '${user?.ic}',
                    ),
                    TextContainerWidget(
                      label: 'noTelefon'.tr(),
                      data: '${user?.noPhone}',
                    ),
                    TextContainerWidget(
                      label: 'emel'.tr(),
                      data: '${user?.emel}',
                    ),
                    TextContainerWidget(
                      label: 'jantina'.tr(),
                      data: '${user?.jantina}',
                    ),
                    TextContainerWidget(
                      label: 'tarikhLahir'.tr(),
                      data: '${user?.dobirth}',
                    ),
                    TextContainerWidget(
                      label: 'pekerjaan'.tr(),
                      data: '${user?.pekerjaan}',
                    ),
                    TextContainerWidget(
                      label: 'warganegara'.tr(),
                      data: '${user?.warganegara}',
                    ),
                    TextContainerWidget(
                      label: 'bangsa'.tr(),
                      data: '${user?.bangsa}',
                    ),
                    TextContainerWidget(
                      label: 'alamat'.tr(),
                      data: '${user?.alamat}',
                    ),
                    TextContainerWidget(
                      label: 'negeri'.tr(),
                      data: '${user?.negeri}',
                    ),
                    TextContainerWidget(
                      label: 'bandar'.tr(),
                      data: '${user?.bandar}',
                    ),
                    TextContainerWidget(
                      label: 'poskod'.tr(),
                      data: '${user?.poskod}',
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 25.w),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(
                                      Colors.white),
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                        horizontal: 5.w, vertical: 1.h),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromRGBO(40, 134, 221, 1)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          side: BorderSide(
                                              color: Color.fromRGBO(
                                                  40, 134, 221, 1))))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditProfilePage()));
                              },
                              child: Text("kemaskiniCap".tr(),
                                  style: TextStyle(fontSize: 10.sp))),
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
      ),
    );
  }
}
