import 'package:Dr/app/di.dart' as di;
import 'package:Dr/app/functions.dart';
import 'package:Dr/data/requests/login_request.dart';
import 'package:Dr/presentation/bloc/Login/login_bloc.dart';
import 'package:Dr/presentation/bloc/password/password_visibility_bloc.dart';
import 'package:Dr/presentation/components/loading.dart';
import 'package:Dr/presentation/resource_data/assets_manager.dart';
import 'package:Dr/presentation/resource_data/color_manager.dart';
import 'package:Dr/presentation/resource_data/font_manager.dart';
import 'package:Dr/presentation/resource_data/style_manager.dart';
import 'package:Dr/presentation/resource_data/values_managers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../resource_data/route_manager.dart';
import '../resource_data/strings_manager.dart';
import '../widgets/custom_text.dart';
import '../widgets/customes_spaces.dart';
import '../widgets/custom_button.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppSignIn extends StatefulWidget {
  AppSignIn({super.key});

  @override
  State<AppSignIn> createState() => _AppSignInState();
}

class _AppSignInState extends State<AppSignIn> {
  final PasswordVisibilityBloc passwordVisibilityBloc =
      PasswordVisibilityBloc();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextEditControl = TextEditingController();

  final TextEditingController _passwordTextEditControl =
      TextEditingController();

  void validateFormThenLogin(BuildContext context) {
    final isValid = _formKey.currentState!.validate();
    final loginRequest = LoginRequest(
        email: _emailTextEditControl.text,
        password: _passwordTextEditControl.text);

    if (isValid) {
      context.read<SignInBloc>().add(SignInEvent(loginRequest: loginRequest));
      // BlocProvider.of<SignInBloc>(context)
      //     .add(SignInEvent(loginRequest: loginRequest));
    }
  }

  @override
  void dispose() {
    super.dispose();
    passwordVisibilityBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        resizeToAvoidBottomInset: true,
        body: Scaffold(
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SafeArea(
                child: Form(
              key: _formKey,
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
                  getTextField(
                    paddingSize: AppSize.s10,
                    labelText: AppStrings.enterEmail,
                    isObscure: false,
                    prefixIcon: Icons.person,
                    onTapTextField: () {},
                    validator: (value) {
                      return value!.isEmpty
                          ? AppStrings.emailCantBeEmpty
                          : null;
                    },
                    controller: _emailTextEditControl,
                  ),
                  BlocBuilder<PasswordVisibilityBloc, PasswordVisibilityState>(
                      builder: (context, state) {
                    return getTextField(
                      paddingSize: AppSize.s10,
                      labelText: AppStrings.enterPassword,
                      isObscure: state is PasswordHidden,
                      prefixIcon: Icons.phone,
                      onTapTextField: () {},
                      validator: (value) {
                        return value!.isEmpty
                            ? AppStrings.passwordCantBeEmpty
                            : null;
                      },
                      controller: _passwordTextEditControl,
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
                  getSizedBox(heightSize: AppSize.s20),
                  BlocConsumer<SignInBloc, SignInState>(
                    listener: (ctx, state) {
                      if (state is LoginLoadingState) {
                        showCustomDialogOfRequests(
                            ctx,
                            getPopupDialog(ctx, popUpLoadingChildren(),
                                ColorManager.white));
                      } else if (state is ErrorLoginState) {
                        dismissDialog(ctx);
                        showScaffoldMessenger(
                          ctx: ctx,
                          message: state.message,
                          bgColor: ColorManager.error,
                        );
                      } else if (state is LoginSuccessState) {
                        dismissDialog(ctx);
                        showScaffoldMessenger(
                          ctx: ctx,
                          message: "تم تسجيل الدخول",
                          bgColor: ColorManager.primary,
                        );

                        Navigator.of(ctx).pushAndRemoveUntil(
                          RouteGenerator.getRoute(
                              const RouteSettings(name: Routes.welcome)),
                          (route) => false,
                        );
                      }
                    },
                    builder: (context, state) {
                      return getButton(
                        buttonText: AppStrings.login,
                        onTap: () {
                          validateFormThenLogin(context);
                        },
                      );
                    },
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
              ),
            )),
          ),
        ));
  }
}
