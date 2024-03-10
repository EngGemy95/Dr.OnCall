import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle getTextStyle(
    {double? fontSize, FontWeight? fontWeight, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: FontConstants.fontFamily,
    color: color,
  );
}

// light style
TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.light, color: color);
}

//Regular Style
TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.regular, color: color);
}

//Medium Style
TextStyle getMediumStyle({
  double fontSize = FontSize.s14,
  required Color color,
}) {
  return getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.medium, color: color);
}

//semiBold Style
TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s14,
  required Color color,
}) {
  return getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.semiBold, color: color);
}

//semiBold Style
TextStyle getCustomFontWeightStyle(
    {double fontSize = FontSize.s14,
    required Color color,
    required FontWeight fontWeight}) {
  return getTextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}

//Bold Style
TextStyle getBoldStyle({
  double fontSize = FontSize.s18,
  required Color color,
}) {
  return getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.bold, color: color);
}
