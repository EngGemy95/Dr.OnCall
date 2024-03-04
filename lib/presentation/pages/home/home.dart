import 'package:Dr/presentation/pages/home/navbar_roots.dart';
import 'package:Dr/presentation/resource_data/assets_manager.dart';
import 'package:Dr/presentation/resource_data/color_manager.dart';
import 'package:Dr/presentation/resource_data/values_managers.dart';
import 'package:Dr/presentation/widgets/customes_spaces.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: AppPadding.p40),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello Alex",
                    style: TextStyle(
                      fontSize: AppSize.s25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CircleAvatar(
                    radius: AppSize.s25,
                    backgroundImage: AssetImage(ImageAssets.doctors),
                  ),
                ],
              ),
            ),
            getSizedBox(heightSize: AppSize.s30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(AppPadding.p20),
                    decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.circular(AppSize.s10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: AppSize.s6,
                            spreadRadius: AppSize.s4,
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(AppPadding.p8),
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            color: ColorManager.primary,
                            size: AppSize.s35,
                          ),
                        ),
                        Text(
                          "Clinic Visit",
                          style: TextStyle(
                            fontSize: AppSize.s18,
                            color: ColorManager.white,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
