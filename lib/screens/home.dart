// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_field, prefer_final_fields

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:complaint_app/controller/aduanController.dart';
import 'package:complaint_app/controller/userController.dart';
import 'package:complaint_app/model/userModel.dart';
import 'package:complaint_app/screens/complain_details.dart';
import 'package:complaint_app/services/assets_image.dart';
import 'package:complaint_app/widget/logo_text.dart';
import 'package:complaint_app/widget/status_box.dart';
import 'package:complaint_app/widget/text_style.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import '../widget/logo_text3.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchCont = TextEditingController();
  final firebaseController = FetchAduanCont();
  List<Map<String, dynamic>> _userAduan = [];
  List<Map<String, dynamic>> _foundAduan =
      []; // This list holds the data for the list view
  bool isLoading = true;
  final userController = UserController();
  UserModel? user;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  bool isUserDataLoaded = false;

  void _onRefresh() async {
    fetchData(); // Fetch your data here
    _refreshController.refreshCompleted();
  }

  void fetchUserData() async {
    user = await userController.fetchUser('User');

    print('Name: ${user!.nama}');
    setState(() {
      isLoading = false;
      isUserDataLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
    fetchData();
    _searchCont.addListener(() {
      firebaseController.searchFilter(
          enteredKeyword: _searchCont.text,
          userAduan: _userAduan,
          onResult: (results) {
            setState(() {
              _foundAduan = results;
            });
          });
    });
  }

  void fetchData() async {
    _userAduan = await firebaseController.fetchAduan();
    setState(() {
      _foundAduan = _userAduan;
    });
  }

  // search function
  void _searchFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _userAduan;
    } else {
      results = _userAduan
          .where((title) => title["tajuk"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundAduan = results;
    });
  }

  @override
  void dispose() {
    _searchCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (!isUserDataLoaded) {
      return Center(
        child: Text(
          'User data not loaded', // Display a message or loading indicator
          style: TextStyle(fontSize: 16.0),
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
          padding: EdgeInsets.all(3.h),
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  TextStyleWidget(
                    label: 'aduanSaya'.tr(),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 18.h,
                  ),
                  TextStyleWidget(
                    label: '${_foundAduan.length} ' + 'rekod'.tr(),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 4.h,
                  child: TextField(
                    controller: _searchCont,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(215, 213, 213, 0.6),
                      hintText: 'carian'.tr(),
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 78, 78, 78)),
                      isDense: true, // Added this
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      suffixIcon: Icon(Iconsax.search_normal_1),
                      suffixIconColor: Color.fromARGB(255, 78, 78, 78),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SmartRefresher(
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  child: _foundAduan.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: _foundAduan.length,
                          itemBuilder: (context, i) => Card(
                            key: ValueKey(_foundAduan[i]),
                            margin: EdgeInsets.all(8),
                            child: Material(
                              child: ListTile(
                                tileColor: Color.fromRGBO(215, 213, 213, 0.6),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide.none),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      _foundAduan[i]["Tajuk"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(_foundAduan[i]["No Rujukan"]
                                        .toString()),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(_foundAduan[i]["Tarikh"]
                                            .toString()),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Text("status".tr()),
                                        StatusBoxWidget(
                                            status: _foundAduan[i]["Status"]
                                                .toString()),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                  ],
                                ),
                                isThreeLine: true,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ComplainDetailsPage(
                                        tajuk:
                                            _foundAduan[i]["Tajuk"].toString(),
                                        status:
                                            _foundAduan[i]["Status"].toString(),
                                        date:
                                            _foundAduan[i]["Tarikh"].toString(),
                                        no_rujukan: _foundAduan[i]["No Rujukan"]
                                            .toString(),
                                        cawangan_diadu: _foundAduan[i]
                                                ["Cawangan Diadu"]
                                            .toString(),
                                        bahagian_diadu: _foundAduan[i]
                                                ["Bahagian Diadu"]
                                            .toString(),
                                        butir_aduan:
                                            _foundAduan[i]["Butir"].toString(),
                                        lokasi:
                                            _foundAduan[i]["Lokasi"].toString(),
                                        lat: _foundAduan[i]["Latitud"]
                                            .toString(),
                                        long: _foundAduan[i]["Longitud"]
                                            .toString(),
                                        aduanId: _foundAduan[i]["AduanID"]
                                            .toString(),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: Text(
                            'tiadaResult'.tr(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
