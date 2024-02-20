import 'package:equatable/equatable.dart';

class RegisterModel extends Equatable {
  final int code;
  final String message;
  final String email;

  RegisterModel({
    required this.code,
    required this.message,
    required this.email,
  });

  @override
  List<Object?> get props => [code, message, email];
}
