import 'package:flutter/material.dart';

import '../resource_data/values_managers.dart';

Widget getSizedBox(
    {double heightSize = AppSize.s20,
    double widthSize = AppSize.s20,
    Widget? widget}) {
  return SizedBox(
    height: heightSize,
    width: widthSize,
    child: widget,
  );
}
