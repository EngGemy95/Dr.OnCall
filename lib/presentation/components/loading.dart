import 'package:blood_donation/presentation/resource_data/color_manager.dart';
import 'package:blood_donation/presentation/resource_data/values_managers.dart';
import 'package:blood_donation/presentation/widgets/customes_spaces.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppPadding.p20),
      child: Center(
        child: getSizedBox(
            heightSize: AppSize.s30,
            widthSize: AppSize.s30,
            widget: CircularProgressIndicator(
              color: ColorManager.primary,
            )),
      ),
    );
  }
}
