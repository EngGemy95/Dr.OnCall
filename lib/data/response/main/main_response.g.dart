// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainResponse<T> _$MainResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    MainResponse<T>(
      message: json['message'] as String,
      status: json['status'] as int,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);
