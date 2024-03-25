import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class MainModel<T> extends Equatable {
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final T? data;

  const MainModel({required this.status, required this.message, this.data});

  @override
  List<Object?> get props => [status, message];

  factory MainModel.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJson) {
    return _$MainModelFromJson(json, fromJson);
  }
}
