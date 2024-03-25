import 'package:dr_on_call/presentation/resource_data/color_manager.dart';
import 'package:dr_on_call/presentation/resource_data/values_managers.dart';
import 'package:dr_on_call/presentation/widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';

class AppointmentMobilePage extends StatelessWidget {
  const AppointmentMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          customSizedBox(heightSize: AppSize.s50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p10),
            child: Stack(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_back,
                        color: ColorManager.white,
                        size: AppSize.s25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      )),
    );
  }
}
