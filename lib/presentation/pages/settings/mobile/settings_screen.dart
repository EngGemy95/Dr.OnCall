import 'package:Dr/presentation/resource_data/assets_manager.dart';
import 'package:Dr/presentation/resource_data/color_manager.dart';
import 'package:Dr/presentation/resource_data/text_manager.dart';
import 'package:Dr/presentation/resource_data/values_managers.dart';
import 'package:Dr/presentation/widgets/customListTile.dart';
import 'package:Dr/presentation/widgets/custom_sized_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: AppPadding.p10,
              left: AppPadding.p20,
              right: AppPadding.p20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                  text: "Settings",
                  fontSize: AppSize.s30,
                  fontWeight: FontWeight.w500,
                  textColor: ColorManager.black,
                ),
                customSizedBox(heightSize: AppSize.s30),
                ListTile(
                  leading: CircleAvatar(
                    radius: AppSize.s30,
                    backgroundImage: AssetImage(ImageAssets.doctor1),
                  ),
                  title: customText(
                    text: "Dr. Doctor Name",
                    fontSize: AppSize.s25,
                    fontWeight: FontWeight.w500,
                    textColor: ColorManager.black,
                  ),
                  subtitle: customText(text: "Profile"),
                ),
                Divider(height: AppSize.s50),
                customListTile(
                    onTapFunc: () {},
                    decorationColor: ColorManager.blueShade100,
                    title: "Profile",
                    boxShape: BoxShape.circle,
                    leadingIcon: CupertinoIcons.person,
                    leadingIconColor: ColorManager.primary,
                    leadingIconSize: AppSize.s30,
                    fontWeight: FontWeight.w500,
                    titleFontSize: AppSize.s20,
                    trailingIcon: Icons.arrow_forward_ios_rounded,
                    titleColor: ColorManager.black),
                customSizedBox(heightSize: AppMargin.m20),
                customListTile(
                  onTapFunc: () {},
                  decorationColor: ColorManager.deepPurpleShade100,
                  title: "Notification",
                  boxShape: BoxShape.circle,
                  leadingIcon: Icons.notifications_none_outlined,
                  leadingIconColor: ColorManager.deepPurple,
                  leadingIconSize: AppSize.s30,
                  fontWeight: FontWeight.w500,
                  titleFontSize: AppSize.s20,
                  trailingIcon: Icons.arrow_forward_ios_rounded,
                  titleColor: ColorManager.black,
                ),
                customSizedBox(heightSize: AppMargin.m20),
                customListTile(
                  onTapFunc: () {},
                  decorationColor: ColorManager.indigoShade100,
                  title: "Privacy",
                  boxShape: BoxShape.circle,
                  leadingIcon: Icons.privacy_tip_outlined,
                  leadingIconColor: ColorManager.indigo,
                  leadingIconSize: AppSize.s30,
                  fontWeight: FontWeight.w500,
                  titleFontSize: AppSize.s20,
                  trailingIcon: Icons.arrow_forward_ios_rounded,
                  titleColor: ColorManager.black,
                ),
                customSizedBox(heightSize: AppMargin.m20),
                customListTile(
                  onTapFunc: () {},
                  decorationColor: ColorManager.greenShade100,
                  title: "General",
                  boxShape: BoxShape.circle,
                  leadingIcon: Icons.settings_suggest_outlined,
                  leadingIconColor: ColorManager.green,
                  leadingIconSize: AppSize.s30,
                  fontWeight: FontWeight.w500,
                  titleFontSize: AppSize.s20,
                  trailingIcon: Icons.arrow_forward_ios_rounded,
                  titleColor: ColorManager.black,
                ),
                customSizedBox(heightSize: AppMargin.m20),
                customListTile(
                  onTapFunc: () {},
                  decorationColor: ColorManager.orangeShade100,
                  title: "About Us",
                  boxShape: BoxShape.circle,
                  leadingIcon: Icons.info_outline_rounded,
                  leadingIconColor: ColorManager.orange,
                  leadingIconSize: AppSize.s30,
                  fontWeight: FontWeight.w500,
                  titleFontSize: AppSize.s20,
                  trailingIcon: Icons.arrow_forward_ios_rounded,
                  titleColor: ColorManager.black,
                ),
                Divider(height: AppSize.s40),
                customListTile(
                  onTapFunc: () {},
                  decorationColor: ColorManager.redAccentShade100,
                  title: "Log out",
                  boxShape: BoxShape.circle,
                  leadingIcon: Icons.logout,
                  leadingIconColor: ColorManager.redAccent,
                  leadingIconSize: AppSize.s30,
                  fontWeight: FontWeight.w500,
                  titleFontSize: AppSize.s20,
                  trailingIcon: Icons.arrow_forward_ios_rounded,
                  titleColor: ColorManager.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
