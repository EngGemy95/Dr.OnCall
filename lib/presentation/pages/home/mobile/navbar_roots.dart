import 'package:dr_on_call/presentation/pages/home/mobile/home.dart';
import 'package:dr_on_call/presentation/pages/settings/mobile/settings_mobile.dart';
import 'package:dr_on_call/presentation/resource_data/color_manager.dart';
import 'package:dr_on_call/presentation/resource_data/values_managers.dart';
import 'package:dr_on_call/presentation/state_management/bloc/current_home/current_home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/di.dart' as di;

class NavBarRoots extends StatefulWidget {
  const NavBarRoots({super.key});

  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
 
  final screens = [
    HomePage(),

    //Schedule Page
    Container(),

    //Settings Page
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return createNavBar();
  }


  BlocBuilder<CurrentHomeBloc, CurrentHomeState> createNavBar() {
    return BlocBuilder<CurrentHomeBloc, CurrentHomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.white,
          body: screens[state is SelectPageState ? state.currentIndex : 0],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: ColorManager.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorManager.primary,
            unselectedItemColor: ColorManager.black,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppSize.s15,
            ),
            currentIndex: state is SelectPageState ? state.currentIndex : 0,
            onTap: (index) {
              context
                  .read<CurrentHomeBloc>()
                  .add(SelectPageEvent(currentPageIndex: index));
            },
            items: const [
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
      },
    );
  }
}
