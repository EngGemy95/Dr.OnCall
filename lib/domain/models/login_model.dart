import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  const LoginModel({required this.message, required this.status, this.data});

  @override
  List<Object?> get props => [message, status, data];

  final String message;
  final int status;
  final LoginData? data;
}

class LoginData extends Equatable {
  final User? user;
  final String? token;

  const LoginData({this.user, this.token});

  @override
  List<Object?> get props => [user];
}

class User extends Equatable {
  final String? name;
  final String? email;
  final String? type;
  const User({this.name, this.email, this.type});

  @override
  List<Object?> get props => [name, email, type];
}
