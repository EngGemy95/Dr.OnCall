import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest extends Equatable {
  final String name;
  final String email;
  final String password;
  final String gender;
  final String bloodType;
  final String phone;
  final String dateOfBirth;

  RegisterRequest(
      {required this.name,
      required this.email,
      required this.password,
      required this.gender,
      required this.bloodType,
      required this.phone,
      required this.dateOfBirth});

  @override
  List<Object?> get props =>
      [name, email, password, gender, bloodType, phone, dateOfBirth];

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
