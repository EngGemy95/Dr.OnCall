import 'package:equatable/equatable.dart';

class RegisterModel extends Equatable {
  final int code;
  final String message;
  final String? data;

  const RegisterModel({
    required this.code,
    required this.message,
    this.data,
  });

  @override
  List<Object?> get props => [code, message, data];
}
