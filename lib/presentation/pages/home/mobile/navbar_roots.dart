import 'package:Dr/presentation/pages/home/mobile/home.dart';
import 'package:Dr/presentation/pages/settings/mobile/settings_mobile.dart';
import 'package:Dr/presentation/resource_data/color_manager.dart';
import 'package:Dr/presentation/resource_data/values_managers.dart';
import 'package:flutter/material.dart';

class NavBarRoots extends StatefulWidget {
  NavBarRoots({super.key});

  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int currentIndex = 0;

  final screens = [
    HomePage(),

    //Schedule Page
    Container(),

    //Settings Page
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorManager.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: ColorManager.black,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: AppSize.s15,
        ),
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
            ),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
