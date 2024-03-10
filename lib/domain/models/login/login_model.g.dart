// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      message: json['message'] as String,
      status: json['status'] as int,
      data: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String?,
      email: json['email'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'type': instance.type,
    };
