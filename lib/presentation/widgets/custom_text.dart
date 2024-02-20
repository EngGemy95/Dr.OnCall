import 'package:flutter/material.dart';

import '../resource_data/values_managers.dart';

Widget getTextField({
  double paddingSize = AppPadding.p10,
  required String labelText,
  bool isObscure = false,
  required IconData prefixIcon,
  Widget? suffixIcon,
  required VoidCallback onTapTextField,
  VoidCallback? onTapSuffxIcon,
}) {
  return Padding(
    padding: EdgeInsets.all(paddingSize),
    child: TextField(
      onTap: onTapTextField,
      style: const TextStyle(color: Colors.black),
      obscureText: isObscure ? true : false,
      decoration: InputDecoration(
        label: Text(labelText),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: isObscure
            ? InkWell(
                onTap: onTapSuffxIcon,
                child: suffixIcon,
              )
            : null,
      ),
    ),
  );
}
