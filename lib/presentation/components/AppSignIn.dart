import 'package:blood_donation/presentation/components/loading.dart';
import 'package:blood_donation/presentation/components/messageDisplay.dart';
import 'package:blood_donation/presentation/resource_data/assets_manager.dart';
import 'package:blood_donation/presentation/resource_data/color_manager.dart';
import 'package:blood_donation/presentation/resource_data/font_manager.dart';
import 'package:blood_donation/presentation/resource_data/style_manager.dart';
import 'package:blood_donation/presentation/resource_data/values_managers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/authenticate/authenticate_bloc.dart';
import '../resource_data/route_manager.dart';
import '../resource_data/strings_manager.dart';
import '../widgets/customes_spaces.dart';
import '../widgets/custom_button.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppSignIn extends StatefulWidget {
  const AppSignIn({super.key});

  @override
  _AppSignInState createState() => _AppSignInState();
}

class _AppSignInState extends State<AppSignIn> {
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocBuilder<AuthenticateBloc, AuthenticateState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return LoadingWidget();
          } else if (state is LoadingSuccessState) {
            return ShowData(
              passToggle: true,
            );
          } else if (state is ErrorLoginState) {
            return MessageDisplayWidget(message: state.message);
          }
          return LoadingWidget();
        },
      ),
    );
  }
}

class ShowData extends StatelessWidget {
  ShowData({super.key, required this.passToggle});

  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SafeArea(
            child: Column(
          children: [
            getSizedBox(
              heightSize: AppSize.s10,
            ),
            Padding(
              padding: const EdgeInsets.all(AppSize.s20),
              child: Image.asset(
                ImageAssets.login,
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            ),
            getSizedBox(heightSize: AppSize.s10),
            Padding(
              padding: const EdgeInsets.all(AppSize.s12),
              child: TextField(
                onTap: () {},
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  label: Text(AppStrings.enterUserName),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSize.s12),
              child: TextField(
                onTap: () {},
                style: const TextStyle(color: Colors.black),
                obscureText: passToggle ? true : false,
                decoration: InputDecoration(
                  label: const Text(AppStrings.enterYourPassword),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () {
                      if (passToggle == true) {
                        passToggle = false;
                      } else {
                        passToggle = true;
                      }
                    },
                    child: passToggle
                        ? const Icon(
                            CupertinoIcons.eye_slash_fill,
                            color: ColorManager.grey,
                          )
                        : Icon(
                            CupertinoIcons.eye_fill,
                            color: ColorManager.primary,
                          ),
                  ),
                ),
              ),
            ),
            getSizedBox(heightSize: AppSize.s20),
            getButton(
              buttonText: AppStrings.login,
              onTap: () {},
            ),
            getSizedBox(heightSize: AppSize.s20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.dontHaveAnyAccount,
                  style: getCustomFontWeightStyle(
                    color: ColorManager.black54,
                    fontSize: FontSize.s16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.register);
                  },
                  child: Text(
                    AppStrings.createAccount,
                    style: getBoldStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s18,
                    ),
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
