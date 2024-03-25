import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class MainResponse<T> extends Equatable {
  @JsonKey(name: "status")
  final int status;
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final T? data;
  const MainResponse({required this.message, required this.status, this.data});

  @override
  List<Object?> get props => [message, status];

  factory MainResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJson,
  ) =>
      _$MainResponseFromJson(json, fromJson);

  // Map<String, dynamic> toJson() => _$MainResponseToJson(this);
}
