import 'dart:io';
import 'dart:typed_data';

import 'package:dr_on_call/app/functions.dart';
import 'package:dr_on_call/presentation/state_management/bloc/gender/gender_bloc.dart';
import 'package:dr_on_call/presentation/resource_data/color_manager.dart';
import 'package:dr_on_call/presentation/resource_data/font_manager.dart';
import 'package:dr_on_call/presentation/resource_data/text_manager.dart';
import 'package:dr_on_call/presentation/state_management/cubit/image_cubit.dart';
import 'package:dr_on_call/presentation/state_management/cubit/image_state.dart';
import 'package:dr_on_call/presentation/widgets/custom_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/requests/profile_request.dart';
import '../../../resource_data/assets_manager.dart';
import '../../../resource_data/strings_manager.dart';
import '../../../resource_data/values_managers.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_sized_box.dart';
import '../../../widgets/custom_text.dart';

class ProfileMobileScreen extends StatelessWidget {
  ProfileMobileScreen({super.key});

  List<String> genders = ['Male', 'Female'];
  List<String> bloodType = [
    AppStrings.selectBloodType,
    'O+',
    'A+',
    'B+',
    'AB+',
    'O-',
    'A-',
    'B-',
    'AB-'
  ];

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? selectedBloodType = AppStrings.selectBloodType;
  late String genderSelected;
  late String? phone;

  void validateFormThenSave(BuildContext context) {
    final isValid = formKey.currentState!.validate();
    if (selectedBloodType == bloodType[0]) {
      selectedBloodType = null;
    }
    if (phoneController.text.isEmpty) {
      phone = null;
    } else {
      phone = phoneController.text;
    }

    print(
        'name : ${nameController.text}  /  phone : $phone  / gender : $genderSelected     / bloodType : $selectedBloodType');
    final editProfileRequest = ProfileRequest(
        name: nameController.text,
        phone: phone,
        gender: genderSelected,
        bloodType: selectedBloodType,
        image: File("///"));

    if (isValid) {
      // context
      //     .read<ProfileBloc>()
      //     .add(EditProfileEvent(editProfileRequest: editProfileRequest));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p15),
            child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customSizedBox(heightSize: AppSize.s30),
                    BlocBuilder<ImageCubit, ImageState>(
                      builder: (context, state) {
                        if (state is ImageLoadedState) {
                          return showAvatar(
                              context: context, loadedState: state);
                        } else if (state is ImageErrorState) {
                          showScaffoldMessenger(
                            ctx: context,
                            message: state.errorMessage,
                            bgColor: ColorManager.primary,
                          );
                          return showAvatar(
                            context: context,
                          );
                        }
                        return showAvatar(
                          context: context,
                        );
                      },
                    ),
                    customSizedBox(heightSize: AppSize.s10),
                    Center(child: customText(text: "your@gmail.com")),
                    customSizedBox(heightSize: AppMargin.m30),
                    customTextField(
                      controller: nameController,
                      paddingSize: AppSize.s10,
                      labelText: "Name",
                      isObscure: false,
                      prefixIcon: Icons.person,
                      onTapTextField: () {},
                      validator: (value) {
                        return value!.isEmpty ? "Enter your name" : null;
                      },
                    ),
                    customTextField(
                      controller: phoneController,
                      paddingSize: AppSize.s10,
                      labelText: "Phone",
                      isObscure: false,
                      prefixIcon: Icons.phone,
                      onTapTextField: () {},
                      validator: (value) {
                        return null;
                      },
                    ),
                    customSizedBox(heightSize: AppSize.s20),
                    customText(
                      leftPadding: AppPadding.p10,
                      text: "Gender",
                      fontWeight: FontWeightManager.bold,
                    ),
                    BlocBuilder<GenderBloc, GenderState>(
                        builder: (context, state) {
                      if (state is MaleSelectedState) {
                        genderSelected = genders[0];
                      } else if (state is FemaleSelectedState) {
                        genderSelected = genders[1];
                      }

                      return Row(
                        children: genders
                            .map((genderType) => Flexible(
                                  child: ListTile(
                                    title: customText(
                                        text: genderType,
                                        fontSize: AppSize.s15,
                                        fontWeight: FontWeightManager.medium),
                                    contentPadding: EdgeInsets.only(
                                      left: width * 0.04,
                                      right: width * 0.04,
                                    ),
                                    leading: Radio(
                                        activeColor: ColorManager.primary,
                                        value: genderType,
                                        groupValue: genderSelected,
                                        onChanged: (value) {
                                          if (genderType.contains(genders[0])) {
                                            context
                                                .read<GenderBloc>()
                                                .add(MaleSelected());
                                          } else if (genderType
                                              .contains(genders[1])) {
                                            context
                                                .read<GenderBloc>()
                                                .add(FemaleSelected());
                                          }
                                        }),
                                  ),
                                ))
                            .toList(),
                      );
                    }),
                    customSizedBox(heightSize: AppSize.s20),
                    customText(
                        leftPadding: AppPadding.p10,
                        text: "Blood Type",
                        fontWeight: FontWeightManager.bold),
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p10),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppSize.s12),
                            borderSide: const BorderSide(
                              width: AppSize.s1,
                              color: ColorManager.grey,
                            ),
                          ),
                        ),
                        value: selectedBloodType,
                        items: bloodType.map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: customText(
                              text: value,
                              textColor: ColorManager.black,
                              fontSize: AppSize.s17,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          selectedBloodType = value;
                          //bloodTypeCubit.selectBloodType(value!);
                        },
                      ),
                    ),
                    customSizedBox(heightSize: AppSize.s50),
                    customButton(
                      buttonText: AppStrings.save,
                      onTap: () {
                        print(
                            "${nameController.text}\t$genderSelected\t$selectedBloodType");

                        validateFormThenSave(context);
                      },
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Center showAvatar(
      {ImageLoadedState? loadedState, required BuildContext context}) {
    return Center(
      child: Stack(
        textDirection: TextDirection.rtl,
        children: [
          loadedState != null
              ? customAvatar(
                  radius: AppSize.s50,
                  imageProvider: FileImage(File(loadedState.imageFile.path)),
                )
              : customAvatar(
                  radius: AppSize.s50,
                  imageProvider:
                      const AssetImage("${CustomPaths.imagePath}doctor1.jpg")),
          Positioned(
            bottom: 0,
            child: customAvatar(
              radius: AppSize.s15,
              childIcon: Icons.add_outlined,
              childIconColor: ColorManager.white,
              backgroundColor: ColorManager.gradientBlue2,
              onTap: () {
                context.read<ImageCubit>().pickImage(ImageSource.gallery);
              },
            ),
          ),
        ],
      ),
    );
  }
}
