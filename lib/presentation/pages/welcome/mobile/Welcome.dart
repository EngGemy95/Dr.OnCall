import 'package:flutter/material.dart';

import '../../../../config/route_manager.dart';
import '../../../resource_data/assets_manager.dart';
import '../../../resource_data/color_manager.dart';
import '../../../resource_data/strings_manager.dart';
import '../../../resource_data/values_managers.dart';
import '../../../widgets/custom_button.dart';

class WelcomeMobileScreen extends StatelessWidget {
  const WelcomeMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.navBarRoots);
                  },
                  child: Text(
                    AppStrings.skip,
                    style: TextStyle(
                      color: ColorManager.primary,
                      fontSize: AppSize.s20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s50,
              ),
              Padding(
                padding: const EdgeInsets.all(AppSize.s20),
                child: Image.asset(ImageAssets.doctors),
              ),
              const SizedBox(
                height: AppSize.s50,
              ),
              Text(
                AppStrings.doctorsAppointment,
                style: TextStyle(
                  color: ColorManager.primary,
                  fontSize: AppSize.s35,
                  fontWeight: FontWeight.bold,
                  letterSpacing: AppSize.s1,
                  wordSpacing: AppSize.s2,
                ),
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              const Text(
                AppStrings.appointmentYourDoctor,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: AppSize.s18,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: AppSize.s60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customButton(
                    buttonText: AppStrings.login,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.login);
                    },
                  ),
                  customButton(
                    buttonText: AppStrings.signUp,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.register);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
