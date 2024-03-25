import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../resource_data/assets_manager.dart';

Widget customAvatar({
  double? radius,
  String? imageName,
  String? url,
  IconData? childIcon,
  Color? childIconColor,
  Color? backgroundColor,
  Uint8List? imageBytes,
  ImageProvider<Object>? imageProvider,
  VoidCallback? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: CircleAvatar(
      radius: radius,
      backgroundImage: imageName != null
          ? const AssetImage("${CustomPaths.imagePath}doctor1.jpg")
          : imageProvider,
      backgroundColor: childIcon != null ? backgroundColor : null,
      child: childIcon != null
          ? Icon(
              childIcon,
              color: childIconColor,
            )
          : null,
    ),
  );
}
