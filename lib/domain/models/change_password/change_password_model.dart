import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_model.g.dart';

@JsonSerializable()
class UpdatePasswordModel extends Equatable {
  String message;
  int status;
  UpdatePasswordModel({
    required this.message,
    required this.status,
  });
  factory UpdatePasswordModel.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordModelFromJson(json);

  @override
  List<Object?> get props => [message, status];
  Map<String, dynamic> toJson() => _$UpdatePasswordModelToJson(this);
}
