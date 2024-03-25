import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final int code;
  final String message;

  const ProfileModel({
    required this.code,
    required this.message,
  });

  @override
  List<Object?> get props => [code, message];
}
