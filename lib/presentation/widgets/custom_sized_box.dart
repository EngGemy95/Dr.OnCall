import 'package:flutter/material.dart';

import '../resource_data/values_managers.dart';

Widget customSizedBox(
    {double heightSize = AppSize.s20,
    double widthSize = AppSize.s20,
    Widget? childWidget}) {
  return SizedBox(
    height: heightSize,
    width: widthSize,
    child: childWidget,
  );
}
