import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'update_password_response.g.dart';

@JsonSerializable()
class UpdatePasswordResponse extends Equatable {
  final int status;
  final String message;

  const UpdatePasswordResponse({
    required this.message,
    required this.status,
  });

  @override
  List<Object?> get props => [message, status];

  factory UpdatePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePasswordResponseToJson(this);
}
