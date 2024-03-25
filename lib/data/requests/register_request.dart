import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest extends Equatable {
  final String name;
  final String email;
  final String password;
  final String phone;

  const RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        phone,
      ];

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
