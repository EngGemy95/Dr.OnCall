import 'package:dr_on_call/presentation/resource_data/color_manager.dart';
import 'package:dr_on_call/presentation/resource_data/values_managers.dart';
import 'package:dr_on_call/presentation/widgets/custom_sized_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
      child: Center(
        child: customSizedBox(
            heightSize: AppSize.s30,
            widthSize: AppSize.s30,
            childWidget: CircularProgressIndicator(
              color: ColorManager.primary,
            )),
      ),
    );
  }
}
