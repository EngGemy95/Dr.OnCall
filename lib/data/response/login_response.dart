import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends Equatable {
  LoginResponse({
    required this.message,
    required this.status,
    this.data,
  });

  @override
  List<Object?> get props => [message, status, data];

  final int status;
  final String message;
  LoginDataResponse? data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginDataResponse extends Equatable {
  String? token;
  UserResponse? user;

  LoginDataResponse({this.user, this.token});

  @override
  List<Object?> get props => [user, token];

  factory LoginDataResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataResponseToJson(this);
}

@JsonSerializable()
class UserResponse extends Equatable {
  String? name;
  String? email;
  String? type;
  UserResponse({this.name, this.email, this.type});

  @override
  List<Object?> get props => [name, email, type];

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
