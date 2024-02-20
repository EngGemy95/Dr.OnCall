import 'package:blood_donation/presentation/components/AppSignIn.dart';
import 'package:blood_donation/presentation/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resource_data/assets_manager.dart';
import '../resource_data/color_manager.dart';
import '../resource_data/font_manager.dart';
import '../resource_data/route_manager.dart';
import '../resource_data/strings_manager.dart';
import '../resource_data/style_manager.dart';
import '../resource_data/values_managers.dart';
import '../widgets/custom_text.dart';
import '../widgets/customes_spaces.dart';

class AppSingUp extends StatelessWidget {
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SafeArea(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSize.s10),
                child: Image.asset(ImageAssets.register),
              ),
              getTextField(
                paddingSize: AppSize.s10,
                labelText: AppStrings.fullName,
                isObscure: false,
                prefixIcon: Icons.person,
                onTapTextField: () {},
              ),
              getTextField(
                paddingSize: AppSize.s10,
                labelText: AppStrings.emailAddress,
                isObscure: false,
                prefixIcon: Icons.email,
                onTapTextField: () {},
              ),
              getTextField(
                paddingSize: AppSize.s10,
                labelText: AppStrings.phoneNumber,
                isObscure: false,
                prefixIcon: Icons.phone,
                onTapTextField: () {},
              ),
              getTextField(
                paddingSize: AppSize.s10,
                labelText: AppStrings.password,
                isObscure: true,
                prefixIcon: Icons.lock,
                suffixIcon: passToggle
                    ? const Icon(
                        CupertinoIcons.eye_slash_fill,
                        color: ColorManager.grey,
                      )
                    : Icon(
                        CupertinoIcons.eye_fill,
                        color: ColorManager.primary,
                      ),
                onTapSuffxIcon: () {
                  if (passToggle == true) {
                    passToggle = false;
                  } else {
                    passToggle = true;
                  }
                  //setState(() {});
                },
                onTapTextField: () {},
              ),
              getSizedBox(heightSize: AppSize.s10),
              getButton(
                buttonText: AppStrings.createAccount,
                onTap: () {},
              ),
              getSizedBox(heightSize: AppSize.s20),
            ],
          )),
        ),
      ),
    );
  }
}
