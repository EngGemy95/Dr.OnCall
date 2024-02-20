import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'RegisterResponse.g.dart';

@JsonSerializable()
class RegisterResponse extends Equatable {
  @JsonKey(name: "code")
  final int code;
  final String message;
  final String email;

  const RegisterResponse(
      {required this.code, required this.message, required this.email});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);

  @override
  List<Object?> get props => [code, message];
}
