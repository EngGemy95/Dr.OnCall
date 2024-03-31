import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_password_request.g.dart';

@JsonSerializable()
class UpdatePasswordRequest extends Equatable {
  final String password;
  final String newPassword;
  final String confirmNewPassword;

  const UpdatePasswordRequest(
      {required this.password,
      required this.newPassword,
      required this.confirmNewPassword});

  @override
  List<Object?> get props => throw UnimplementedError();

  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePasswordRequestToJson(this);
}
