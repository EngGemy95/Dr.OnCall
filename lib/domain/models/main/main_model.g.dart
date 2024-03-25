// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainModel<T> _$MainModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    MainModel<T>(
      status: json['status'] as String,
      message: json['message'] as String,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);
