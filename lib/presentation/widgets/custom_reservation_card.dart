import 'package:flutter/material.dart';

import '../resource_data/color_manager.dart';
import '../resource_data/text_manager.dart';
import '../resource_data/values_managers.dart';
import 'custom_sized_box.dart';

Widget customReservationCard({
  Color? containerColor,
  Widget? icon,
  Color? iconColor,
  Color? iconBackgroundColor,
  String? textName,
  Color? textNameColor,
  String? subText,
  Color? subTextColor,
}) {
  return InkWell(
    onTap: () {},
    child: Container(
      padding: const EdgeInsets.all(AppPadding.p20),
      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(AppSize.s10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: AppSize.s6,
              spreadRadius: AppSize.s4,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p8),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
          customSizedBox(heightSize: AppSize.s20),
          customText(
              text: textName!,
              textColor: textNameColor,
              fontSize: AppSize.s18,
              fontWeight: FontWeight.w500),
          customSizedBox(heightSize: AppSize.s5),
          customText(
              text: subText!,
              textColor: subTextColor,
              fontSize: AppSize.s14,
              fontWeight: FontWeight.w500),
        ],
      ),
    ),
  );
}
