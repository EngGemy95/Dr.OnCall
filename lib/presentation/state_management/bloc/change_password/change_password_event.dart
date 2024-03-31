part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class UpdatePasswordEvent extends ChangePasswordEvent {
  final UpdatePasswordRequest updatePasswordRequest;

  const UpdatePasswordEvent({required this.updatePasswordRequest});

  @override
  List<Object> get props => [updatePasswordRequest];
}
