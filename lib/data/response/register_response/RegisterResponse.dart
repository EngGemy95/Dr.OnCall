 import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'RegisterResponse.g.dart';

@JsonSerializable()
class RegisterResponse extends Equatable {
  final int status;
  final String message;
  final String? data;

  const RegisterResponse(
      {required this.status, required this.message, this.data});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);

  @override
  List<Object?> get props => [status, message, data];
}
