// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileResponse _$UpdateProfileResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileResponse(
      status: json['status'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$UpdateProfileResponseToJson(
        UpdateProfileResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
