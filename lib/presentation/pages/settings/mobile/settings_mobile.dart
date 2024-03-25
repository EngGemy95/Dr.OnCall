import 'package:dr_on_call/presentation/state_management/bloc/switch_dark_mode/switch_dark_mode_bloc.dart';
import 'package:dr_on_call/presentation/resource_data/assets_manager.dart';
import 'package:dr_on_call/presentation/resource_data/color_manager.dart';
import 'package:dr_on_call/presentation/resource_data/text_manager.dart';
import 'package:dr_on_call/presentation/resource_data/values_managers.dart';
import 'package:dr_on_call/presentation/widgets/custom_sized_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resource_data/route_manager.dart';
import '../../../widgets/customListTile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: AppPadding.p10,
              left: AppPadding.p20,
              right: AppPadding.p20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                  text: "Settings",
                  fontSize: AppSize.s25,
                  fontWeight: FontWeight.w500,
                  textColor: ColorManager.black,
                ),
                customSizedBox(heightSize: AppSize.s30),
                ListTile(
                  leading: const CircleAvatar(
                    radius: AppSize.s30,
                    backgroundImage: AssetImage(ImageAssets.doctor1),
                  ),
                  title: customText(
                    text: "dr_on_call. Doctor Name",
                    fontSize: AppSize.s20,
                    fontWeight: FontWeight.w500,
                    textColor: ColorManager.black,
                  ),
                  subtitle:
                      customText(text: "Edit personal details", topPadding: 0),
                ),
                const Divider(height: AppSize.s25),
                BlocBuilder<SwitchModeBloc, SwitchModeState>(
                  builder: (context, state) {
                    return customListTile(
                      onTapFunc: () {},
                      decorationColor: ColorManager.grey,
                      title: "Dark Mode",
                      boxShape: BoxShape.circle,
                      leadingIcon: CupertinoIcons.moon_fill,
                      leadingIconColor: ColorManager.white,
                      fontWeight: FontWeight.w500,
                      trailingWidget: Switch(
                        value: state is SwitchOff,
                        onChanged: (value) {
                          context
                              .read<SwitchModeBloc>()
                              .add(ToggleSwitchMode());
                        },
                        activeColor: ColorManager.primary,
                      ),
                      titleColor: ColorManager.black,
                    );
                  },
                ),
                customSizedBox(heightSize: AppMargin.m10),
                customListTile(
                  onTapFunc: () {
                    Navigator.pushNamed(context, Routes.profile);
                  },
                  decorationColor: ColorManager.blueShade100,
                  title: "Profile",
                  boxShape: BoxShape.circle,
                  leadingIcon: CupertinoIcons.person,
                  leadingIconColor: ColorManager.primary,
                  fontWeight: FontWeight.w500,
                  trailingIcon: Icons.arrow_forward_ios_rounded,
                  titleColor: ColorManager.black,
                ),
                customSizedBox(heightSize: AppMargin.m10),
                customListTile(
                  onTapFunc: () {
                    Navigator.pushNamed(context, Routes.changePassword);
                  },
                  decorationColor: ColorManager.indigoShade100,
                  title: "Change Password",
                  boxShape: BoxShape.circle,
                  leadingIcon: Icons.key_outlined,
                  leadingIconColor: ColorManager.indigo,
                  fontWeight: FontWeight.w500,
                  trailingIcon: Icons.arrow_forward_ios_rounded,
                  titleColor: ColorManager.black,
                ),
                customSizedBox(heightSize: AppMargin.m10),
                customListTile(
                  onTapFunc: () {},
                  decorationColor: ColorManager.deepPurpleShade100,
                  title: "Notification",
                  boxShape: BoxShape.circle,
                  leadingIcon: Icons.notifications_none_outlined,
                  leadingIconColor: ColorManager.deepPurple,
                  fontWeight: FontWeight.w500,
                  trailingIcon: Icons.arrow_forward_ios_rounded,
                  titleColor: ColorManager.black,
                ),
                customSizedBox(heightSize: AppMargin.m10),
                customListTile(
                  onTapFunc: () {},
                  decorationColor: ColorManager.greenShade100,
                  title: "Language",
                  boxShape: BoxShape.circle,
                  leadingIcon: Icons.language_outlined,
                  leadingIconColor: ColorManager.green,
                  fontWeight: FontWeight.w500,
                  trailingIcon: Icons.arrow_forward_ios_rounded,
                  titleColor: ColorManager.black,
                ),
                customSizedBox(heightSize: AppMargin.m10),
                customListTile(
                  onTapFunc: () {},
                  decorationColor: ColorManager.orangeShade100,
                  title: "About Us",
                  boxShape: BoxShape.circle,
                  leadingIcon: Icons.info_outline_rounded,
                  leadingIconColor: ColorManager.orange,
                  fontWeight: FontWeight.w500,
                  trailingIcon: Icons.arrow_forward_ios_rounded,
                  titleColor: ColorManager.black,
                ),
                const Divider(height: AppSize.s40),
                customListTile(
                  onTapFunc: () {},
                  decorationColor: ColorManager.redAccentShade100,
                  title: "Logout",
                  boxShape: BoxShape.circle,
                  leadingIcon: Icons.logout,
                  leadingIconColor: ColorManager.redAccent,
                  fontWeight: FontWeight.w500,
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
