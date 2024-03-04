import 'package:Dr/presentation/pages/home/home.dart';
import 'package:Dr/presentation/resource_data/color_manager.dart';
import 'package:Dr/presentation/resource_data/values_managers.dart';
import 'package:flutter/material.dart';

class NavBarRoots extends StatelessWidget {
  NavBarRoots({super.key});

  int currentIndex = 0;
  final screens = [
    HomePage(),

    //Schedule Page
    Container(),

    //Settings Page
    Container()
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
