part of 'change_password_bloc.dart';

abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object> get props => [];
}

final class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {
  @override
  List<Object> get props => [];
}

class UpdatePasswordSuccessState extends ChangePasswordState {
  @override
  List<Object> get props => [];
}

class ErrorUpdatePasswordState extends ChangePasswordState {
  final String message;

  const ErrorUpdatePasswordState({required this.message});

  @override
  List<Object> get props => [message];
}
