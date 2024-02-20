import 'package:flutter/material.dart';

import '../resource_data/color_manager.dart';
import '../resource_data/values_managers.dart';

Widget getButton({
  required VoidCallback onTap,
  required String buttonText,
}) {
  return Padding(
    padding: const EdgeInsets.all(AppPadding.p10),
    child: SizedBox(
      // width: double.infinity,
      child: Material(
        color: ColorManager.primary,
        borderRadius: BorderRadius.circular(AppSize.s10),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p8,
              horizontal: AppPadding.p40,
            ),
            child: Center(
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: AppSize.s24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
