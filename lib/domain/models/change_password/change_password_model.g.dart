// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePasswordModel _$UpdatePasswordModelFromJson(Map<String, dynamic> json) =>
    UpdatePasswordModel(
      message: json['message'] as String,
      status: json['status'] as int,
    );

Map<String, dynamic> _$UpdatePasswordModelToJson(
        UpdatePasswordModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
