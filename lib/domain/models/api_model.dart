import 'package:equatable/equatable.dart';

class ApiModel extends Equatable {
  final int code;
  final String message;
  final String token;
  final Object data;

  ApiModel({
    required this.code,
    required this.message,
    required this.token,
    required this.data,
  });

  @override
  List<Object?> get props => [code, message, token, data];
}
