import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginData extends Equatable {
  User? user;
  String? token;

  LoginData({this.user, this.token});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  @override
  List<Object?> get props => [user];
  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable()
class LoginModel extends Equatable {
  String message;
  int status;

  final LoginData? data;
  LoginModel({required this.message, required this.status, this.data});
  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  @override
  List<Object?> get props => [message, status, data];
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable()
class User extends Equatable {
  final String? name;
  final String? email;
  final String? type;
  const User({this.name, this.email, this.type});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  List<Object?> get props => [name, email, type];
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
