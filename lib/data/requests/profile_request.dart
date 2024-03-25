import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class ProfileRequest extends Equatable {
  final String name;
  final String? phone;
  final String? bloodType;
  final String gender;
  final File? image;

  const ProfileRequest({
    required this.name,
    required this.phone,
    required this.bloodType,
    required this.gender,
    required this.image,
  });

  @override
  List<Object?> get props => [
        name,
        phone,
        bloodType,
        gender,
        image,
      ];
}
