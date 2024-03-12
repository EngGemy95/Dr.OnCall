import 'package:flutter/material.dart';

import '../resource_data/text_manager.dart';
import '../resource_data/values_managers.dart';

Widget customListTile({
  Color? decorationColor,
  required BoxShape boxShape,
  IconData? leadingIcon,
  Color? leadingIconColor,
  double? leadingIconSize = AppSize.s25,
  required String title,
  FontWeight? fontWeight,
  double? titleFontSize = AppSize.s18,
  IconData? trailingIcon,
  Widget? trailingWidget,
  Color? trailingIconColor,
  Color? titleColor,
  VoidCallback? onTapFunc,
}) {
  return ListTile(
    onTap: onTapFunc,
    leading: Container(
      padding: const EdgeInsets.all(AppPadding.p5),
      decoration: BoxDecoration(
        color: decorationColor,
        shape: boxShape,
      ),
      child: Icon(
        leadingIcon,
        color: leadingIconColor,
        size: leadingIconSize,
      ),
    ),
    title: customText(
      text: title,
      textColor: titleColor,
      fontWeight: fontWeight,
      fontSize: titleFontSize,
    ),
    trailing: trailingWidget ??
        Icon(
          trailingIcon,
          color: trailingIconColor,
        ),
  );
}
