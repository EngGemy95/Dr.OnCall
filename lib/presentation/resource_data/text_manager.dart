import 'package:dr_on_call/presentation/resource_data/style_manager.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'values_managers.dart';

Widget customText({
  required String text,
  Color? textColor = ColorManager.black54,
  double? fontSize = AppSize.s14,
  FontWeight? fontWeight,
  int? maxLine,
  double minFontSize = AppSize.s14,
  double maxFontSize = AppSize.s35,
  double leftPadding = 0,
  double topPadding = 0,
  double rightPadding = 0,
  double bottomPadding = 0,
}) {
  return Padding(
    padding: EdgeInsets.only(
      left: leftPadding,
      top: topPadding,
      right: rightPadding,
      bottom: bottomPadding,
    ),
    child: AutoSizeText(
      text,
      maxLines: maxLine,
      minFontSize: minFontSize,
      maxFontSize: maxFontSize,
      overflow: TextOverflow.ellipsis,
      style: getTextStyle(
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,
      ),
    ),
  );
}
