// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      message: json['message'] as String,
      status: json['status'] as int,
      data: json['data'] == null
          ? null
          : LoginDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

LoginDataResponse _$LoginDataResponseFromJson(Map<String, dynamic> json) =>
    LoginDataResponse(
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginDataResponseToJson(LoginDataResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      name: json['name'] as String?,
      email: json['email'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'type': instance.type,
    };
