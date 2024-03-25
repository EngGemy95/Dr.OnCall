import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_profile_response.g.dart';

@JsonSerializable()
class UpdateProfileResponse extends Equatable {
  final int status;
  final String message;

  const UpdateProfileResponse({
    required this.status,
    required this.message,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileResponseToJson(this);

  @override
  List<Object?> get props => [
        status,
        message,
      ];
}
