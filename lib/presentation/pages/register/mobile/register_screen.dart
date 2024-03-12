import 'package:Dr/data/requests/register_request.dart';
import 'package:Dr/presentation/bloc/password/password_visibility_bloc.dart';
import 'package:Dr/presentation/bloc/register/register_bloc.dart';
import 'package:Dr/presentation/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/functions.dart';
import '../../../resource_data/assets_manager.dart';
import '../../../resource_data/color_manager.dart';
import '../../../resource_data/route_manager.dart';
import '../../../resource_data/strings_manager.dart';
import '../../../resource_data/values_managers.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_sized_box.dart';

class AppSingUp extends StatefulWidget {
  const AppSingUp({super.key});

  @override
  State<AppSingUp> createState() => _AppSingUpState();
}

class _AppSingUpState extends State<AppSingUp> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameTextEditControl =
      TextEditingController();

  final TextEditingController _emailTextEditControl = TextEditingController();

  final TextEditingController _phoneTextEditControl = TextEditingController();

  final TextEditingController _passwordTextEditControl =
      TextEditingController();

  void validateFormThenRegister(BuildContext context) {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      RegisterRequest registerRequest = RegisterRequest(
        name: _fullNameTextEditControl.text,
        email: _emailTextEditControl.text,
        password: _passwordTextEditControl.text,
        phone: _phoneTextEditControl.text,
      );
      context
          .read<RegisterBloc>()
          .add(SignUpEvent(registerRequest: registerRequest));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   title: Text(""),
      // ),
      appBar: null,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SafeArea(
            child: Form(
          key: _formKey,
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
                validator: (value) {
                  return value!.isEmpty ? AppStrings.nameCantBeEmpty : null;
                },
                controller: _fullNameTextEditControl,
              ),
              getTextField(
                paddingSize: AppSize.s10,
                labelText: AppStrings.emailAddress,
                isObscure: false,
                prefixIcon: Icons.email,
                onTapTextField: () {},
                validator: (value) {
                  return value!.isEmpty ? AppStrings.emailCantBeEmpty : null;
                },
                controller: _emailTextEditControl,
              ),
              getTextField(
                paddingSize: AppSize.s10,
                labelText: AppStrings.phoneNumber,
                isObscure: false,
                prefixIcon: Icons.phone,
                onTapTextField: () {},
                validator: (value) {
                  return value!.isEmpty ? AppStrings.phoneCantBeEmpty : null;
                },
                controller: _phoneTextEditControl,
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
              customSizedBox(heightSize: AppSize.s10),
              BlocListener<RegisterBloc, RegisterState>(
                  child: getButton(
                    buttonText: AppStrings.createAccount,
                    onTap: () {
                      validateFormThenRegister(context);
                    },
                  ),
                  listener: (ctx, state) {
                    if (state is RegisterLoadingState) {
                      showCustomDialogOfRequests(
                        ctx,
                        getPopupDialog(
                            ctx, popUpLoadingChildren(), ColorManager.white),
                      );
                    } else if (state is RegisterErrorState) {
                      dismissDialog(ctx);
                      showScaffoldMessenger(
                        ctx: ctx,
                        message: state.message,
                        bgColor: ColorManager.error,
                      );
                    } else if (state is RegisterSuccessState) {
                      dismissDialog(ctx);
                      showScaffoldMessenger(
                        ctx: ctx,
                        message: "تم التسجيل بنجاح",
                        bgColor: ColorManager.primary,
                      );

                      Navigator.of(ctx).pushAndRemoveUntil(
                        RouteGenerator.getRoute(
                            const RouteSettings(name: Routes.login)),
                        (route) => false,
                      );
                    }
                  }),
            ],
          ),
        )),
      ),
    );
  }
}
