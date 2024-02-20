import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ApiResponse.g.dart';

@JsonSerializable()
class ApiResponse extends Equatable {
  @JsonKey(name: "code")
  final int code;
  final String message;
  final String token;
  final Object? data;

  const ApiResponse({
    required this.code,
    required this.message,
    required this.token,
    this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);

  @override
  List<Object?> get props => [code, message, token, data];
}
