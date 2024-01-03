// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:complaint_app/screens/add_complain.dart';
import 'package:complaint_app/screens/home.dart';
import 'package:complaint_app/screens/info.dart';
import 'package:complaint_app/screens/profile.dart';
import 'package:complaint_app/screens/setting.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    InfoPage(),
    ComplainPage(),
    ProfilePage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border:
                Border.symmetric(horizontal: BorderSide(color: Colors.black))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
          child: GNav(
            tabBackgroundColor: Colors.black,
            hoverColor: Colors.black,
            activeColor: Colors.white,
            gap: 8,
            onTabChange: _navigateBottomBar,
            padding: EdgeInsets.all(15),
            tabs: [
              GButton(icon: Iconsax.home),
              GButton(icon: Iconsax.info_circle),
              GButton(icon: Iconsax.add_square),
              GButton(icon: Iconsax.profile_circle),
              GButton(icon: Iconsax.setting),
            ],
          ),
        ),
      ),
    );
  }
}
