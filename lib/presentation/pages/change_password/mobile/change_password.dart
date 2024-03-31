import 'package:dr_on_call/utils/di.dart';
import 'package:dr_on_call/utils/responsive.dart';
import 'package:dr_on_call/presentation/resource_data/color_manager.dart';
import 'package:dr_on_call/presentation/resource_data/values_managers.dart';
import 'package:dr_on_call/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/route_manager.dart';
import '../../../../data/requests/update_password/update_password_request.dart';
import '../../../../utils/functions.dart';
import '../../../resource_data/strings_manager.dart';
import '../../../state_management/bloc/change_password/change_password_bloc.dart';
import '../../../state_management/bloc/password/password_visibility_bloc.dart';
import '../../../widgets/custom_button.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmedPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateFormThenUpdatePassword(BuildContext context) {
    final isValidate = formKey.currentState!.validate();
    if (isValidate) {
      UpdatePasswordRequest request = UpdatePasswordRequest(
        password: currentPasswordController.text,
        newPassword: newPasswordController.text,
        confirmNewPassword: confirmedPasswordController.text,
      );

      context
          .read<ChangePasswordBloc>()
          .add(UpdatePasswordEvent(updatePasswordRequest: request));
    }
  }

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
                            controller: confirmedPasswordController,
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
                        margin: const EdgeInsets.only(top: AppMargin.m30),
                        child: BlocListener<ChangePasswordBloc,
                            ChangePasswordState>(
                          child: customButton(
                            buttonText: "Update",
                            onTap: () {
                              validateFormThenUpdatePassword(context);
                            },
                          ),
                          listener: (ctx, state) async {
                            if (state is ChangePasswordLoadingState) {
                              showCustomDialogOfRequests(
                                  ctx,
                                  getPopupDialog(ctx, popUpLoadingChildren(),
                                      ColorManager.white));
                            } else if (state is ErrorUpdatePasswordState) {
                              closeKeyboardIfOpened(context);
                              dismissDialog(context);
                              showScaffoldMessenger(
                                ctx: context,
                                message: state.message,
                                bgColor: ColorManager.error,
                              );
                            } else if (state is UpdatePasswordSuccessState) {
                              dismissDialog(ctx);
                              showScaffoldMessenger(
                                ctx: ctx,
                                message: "تم تغيير الرقم السرى",
                                bgColor: ColorManager.primary,
                              );

                              Navigator.of(ctx).pushAndRemoveUntil(
                                RouteGenerator.getRoute(
                                    const RouteSettings(name: Routes.login)),
                                (route) => false,
                              );
                            }
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
