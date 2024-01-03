// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:complaint_app/widget/main_text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../widget/bottombar.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  GoogleMapController? mapController;

  static final CameraPosition _ppns = CameraPosition(
      target: LatLng(6.0152338320082706, 116.11105222553914), zoom: 16.0);

  static final Marker _ppnsMarker = Marker(
    markerId: MarkerId('_ppns'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(6.0152338320082706, 116.11105222553914),
  );

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
            "Info",
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
            padding: const EdgeInsets.fromLTRB(60, 10, 50, 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.home_work_outlined,
                        size: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                        child: MainTextWidget(
                          label: 'alamatPerhubungan'.tr(),
                          fontsize: 14.sp,
                        ),
                      )
                    ],
                  ),
                  MainTextWidget(label: 'EZY ITZY COMPANY'),
                  MainTextWidget(label: 'Customer Service Department,'),
                  MainTextWidget(label: 'No 03, Level 8'),
                  MainTextWidget(label: 'Millenium Tower,'),
                  MainTextWidget(label: '88400 Kota Kinabalu Sabah.'),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Iconsax.call,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                        child: MainTextWidget(
                          label: '088-369000',
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Iconsax.directbox_notif,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                        child: MainTextWidget(
                          label: '088-214134',
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Iconsax.sms,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                        child: MainTextWidget(
                          label: 'cs.ezyitzy@gmail.com',
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Iconsax.map_1,
                        size: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                        child: MainTextWidget(
                          label: 'petaLokasi'.tr(),
                          fontsize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    height: 25.h,
                    child: GoogleMap(
                      initialCameraPosition: _ppns,
                      markers: {_ppnsMarker},
                      onMapCreated: _onMapCreated,
                    ),
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
