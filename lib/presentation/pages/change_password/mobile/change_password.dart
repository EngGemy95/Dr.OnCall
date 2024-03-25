import 'package:dr_on_call/app/responsive.dart';
import 'package:dr_on_call/presentation/resource_data/color_manager.dart';
import 'package:dr_on_call/presentation/resource_data/values_managers.dart';
import 'package:dr_on_call/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resource_data/strings_manager.dart';
import '../../../state_management/bloc/password/password_visibility_bloc.dart';
import '../../../widgets/custom_button.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmedPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateFormThenUpdatePassword(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return showBody(context);
  }

  Widget showBody(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Responsive(
          mobile: Center(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s10),
                  color: ColorManager.white,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocProvider(
                          create: (context) => PasswordVisibilityBloc(),
                          child: BlocBuilder<PasswordVisibilityBloc,
                                  PasswordVisibilityState>(
                              builder: (context, state) {
                            return customTextField(
                              paddingSize: AppSize.s10,
                              labelText: "Current Password",
                              isObscure: state is PasswordHidden,
                              prefixIcon: Icons.lock_open_outlined,
                              onTapTextField: () {},
                              validator: (value) {
                                return value!.isEmpty
                                    ? AppStrings.passwordCantBeEmpty
                                    : null;
                              },
                              controller: currentPasswordController,
                              onTapSuffxIcon: () {
                                context
                                    .read<PasswordVisibilityBloc>()
                                    .add(TogglePasswordVisibility());
                              },
                              suffixIconChild: state is PasswordHidden
                                  ? const Icon(
                                      CupertinoIcons.eye_slash_fill,
                                      color: ColorManager.grey,
                                    )
                                  : Icon(
                                      CupertinoIcons.eye_fill,
                                      color: ColorManager.primary,
                                    ),
                            );
                          })),
                      BlocProvider(
                        create: (context) => PasswordVisibilityBloc(),
                        child: BlocBuilder<PasswordVisibilityBloc,
                            PasswordVisibilityState>(builder: (context, state) {
                          return customTextField(
                            paddingSize: AppSize.s10,
                            labelText: "New Password",
                            isObscure: state is PasswordHidden,
                            prefixIcon: Icons.lock_outline,
                            onTapTextField: () {},
                            validator: (value) {
                              return value!.isEmpty
                                  ? AppStrings.passwordCantBeEmpty
                                  : null;
                            },
                            controller: newPasswordController,
                            onTapSuffxIcon: () {
                              context
                                  .read<PasswordVisibilityBloc>()
                                  .add(TogglePasswordVisibility());
                            },
                            suffixIconChild: state is PasswordHidden
                                ? const Icon(
                                    CupertinoIcons.eye_slash_fill,
                                    color: ColorManager.grey,
                                  )
                                : Icon(
                                    CupertinoIcons.eye_fill,
                                    color: ColorManager.primary,
                                  ),
                          );
                        }),
                      ),
                      BlocProvider(
                        create: (context) => PasswordVisibilityBloc(),
                        child: BlocBuilder<PasswordVisibilityBloc,
                            PasswordVisibilityState>(builder: (context, state) {
                          return customTextField(
                            paddingSize: AppSize.s10,
                            labelText: "Confirm Password",
                            isObscure: state is PasswordHidden,
                            prefixIcon: Icons.lock_outline,
                            onTapTextField: () {},
                            validator: (value) {
                              return value!.isEmpty
                                  ? AppStrings.passwordCantBeEmpty
                                  : null;
                            },
                            controller: newPasswordController,
                            onTapSuffxIcon: () {
                              context
                                  .read<PasswordVisibilityBloc>()
                                  .add(TogglePasswordVisibility());
                            },
                            suffixIconChild: state is PasswordHidden
                                ? const Icon(
                                    CupertinoIcons.eye_slash_fill,
                                    color: ColorManager.grey,
                                  )
                                : Icon(
                                    CupertinoIcons.eye_fill,
                                    color: ColorManager.primary,
                                  ),
                          );
                        }),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: AppMargin.m30),
                        child: customButton(
                          buttonText: "Update",
                          onTap: () {
                            validateFormThenUpdatePassword(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          tablet: const Center(
            child: Text("Tablet"),
          ),
          desktop: const Center(
            child: Text("Desktop"),
          ),
        ),
      ),
    );
  }
}
