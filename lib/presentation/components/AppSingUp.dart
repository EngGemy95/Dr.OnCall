import 'package:Dr/data/requests/register_request.dart';
import 'package:Dr/presentation/bloc/password/password_visibility_bloc.dart';
import 'package:Dr/presentation/bloc/register/register_bloc.dart';
import 'package:Dr/presentation/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../resource_data/assets_manager.dart';
import '../resource_data/color_manager.dart';
import '../resource_data/strings_manager.dart';
import '../resource_data/values_managers.dart';
import '../widgets/custom_text.dart';
import '../widgets/customes_spaces.dart';

class AppSingUp extends StatefulWidget {
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
        gender: "Male Or Female",
        bloodType: "O+",
        phone: _phoneTextEditControl.text,
        dateOfBirth: "31/5/1995",
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
              getSizedBox(heightSize: AppSize.s10),
              getButton(
                buttonText: AppStrings.createAccount,
                onTap: () {
                  validateFormThenRegister(context);
                },
              ),
              getSizedBox(heightSize: AppSize.s20),
            ],
          ),
        )),
      ),
    );
  }
}
