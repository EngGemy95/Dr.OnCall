import 'package:flutter/material.dart';

import '../resource_data/values_managers.dart';

Widget customTextField({
  double paddingSize = AppPadding.p10,
  required String labelText,
  bool isEnabled = true,
  bool isObscure = false,
  required IconData prefixIcon,
  Widget? suffixIconChild,
  required VoidCallback onTapTextField,
  VoidCallback? onTapSuffxIcon,
  required String? Function(String?) validator,
  TextEditingController? controller,
}) {
  return Padding(
    padding: EdgeInsets.all(paddingSize),
    child: TextFormField(
      onTap: onTapTextField,
      controller: controller,
      validator: validator,
      enabled: isEnabled,
      // onChanged: (value) {
      //   controller?.text = value;
      // },
      style: const TextStyle(color: Colors.black),
      obscureText: isObscure ? true : false,
      decoration: InputDecoration(
        label: Text(labelText),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: InkWell(
          onTap: onTapSuffxIcon,
          child: suffixIconChild ?? const Text(""),
        ),
      ),
    ),
  );
}
