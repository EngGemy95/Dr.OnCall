import 'package:dr_on_call/presentation/resource_data/text_manager.dart';
import 'package:dr_on_call/utils/functions.dart';
import 'package:dr_on_call/data/requests/login/login_request.dart';
import 'package:dr_on_call/presentation/state_management/bloc/password/password_visibility_bloc.dart';
import 'package:dr_on_call/presentation/resource_data/assets_manager.dart';
import 'package:dr_on_call/presentation/resource_data/color_manager.dart';
import 'package:dr_on_call/presentation/resource_data/font_manager.dart';
import 'package:dr_on_call/presentation/resource_data/style_manager.dart';
import 'package:dr_on_call/presentation/resource_data/values_managers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../utils/app_prefs.dart';
import '../../../../utils/di.dart' as di;
import '../../../../config/route_manager.dart';
import '../../../resource_data/strings_manager.dart';
import '../../../state_management/bloc/login/login_bloc.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_sized_box.dart';
import '../../../widgets/custom_button.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppSignIn extends StatefulWidget {
  const AppSignIn({super.key});

  @override
  State<AppSignIn> createState() => _AppSignInState();
}

class _AppSignInState extends State<AppSignIn> {
  final PasswordVisibilityBloc passwordVisibilityBloc =
      PasswordVisibilityBloc();

  final TextEditingController _emailTextEditControl = TextEditingController();

  final TextEditingController _passwordTextEditControl =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final AppPreference appPreference = di.instance<AppPreference>();

  void validateFormThenLogin(BuildContext context) {
    final isValid = _formKey.currentState!.validate();
    final loginRequest = LoginRequest(
      email: _emailTextEditControl.text,
      password: _passwordTextEditControl.text,
    );

    if (isValid) {
      context.read<SignInBloc>().add(SignInEvent(loginRequest: loginRequest));
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
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SafeArea(
            child: Form(
          key: _formKey,
          child: Column(
            children: [
              customSizedBox(
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
              customSizedBox(heightSize: AppSize.s10),
              customTextField(
                paddingSize: AppSize.s10,
                labelText: AppStrings.enterEmail,
                isObscure: false,
                prefixIcon: Icons.person,
                onTapTextField: () {},
                validator: (value) {
                  return value!.isEmpty ? AppStrings.emailCantBeEmpty : null;
                },
                controller: _emailTextEditControl,
              ),
              BlocBuilder<PasswordVisibilityBloc, PasswordVisibilityState>(
                  builder: (context, state) {
                return customTextField(
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
              customSizedBox(heightSize: AppSize.s20),
              BlocListener<SignInBloc, SignInState>(
                child: customButton(
                  buttonText: AppStrings.login,
                  onTap: () {
                    validateFormThenLogin(context);
                  },
                ),
                listener: (ctx, state) async {
                  if (state is LoginLoadingState) {
                    showCustomDialogOfRequests(
                        ctx,
                        getPopupDialog(
                            ctx, popUpLoadingChildren(), ColorManager.white));
                  } else if (state is ErrorLoginState) {
                    closeKeyboardIfOpened(context);
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

                    print((appPreference.getUserData())?.user!.email);

                    Navigator.of(ctx).pushAndRemoveUntil(
                      RouteGenerator.getRoute(
                          const RouteSettings(name: Routes.welcome)),
                      (route) => false,
                    );
                  }
                },
              ),
              customSizedBox(heightSize: AppSize.s20),
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
              ),
            ],
          ),
        )),
      ),
    );
  }
}
