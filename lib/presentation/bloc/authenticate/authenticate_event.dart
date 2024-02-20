part of 'authenticate_bloc.dart';

sealed class AuthenticateEvent extends Equatable {
  const AuthenticateEvent();

  @override
  List<Object> get props => [];
}

class ShowPasswordEvent extends AuthenticateEvent {}

class LoginEvent extends AuthenticateEvent {
  final LoginRequest loginRequest;

  LoginEvent({required this.loginRequest});

  @override
  List<Object> get props => [loginRequest];
}

class RegisterEvent extends AuthenticateEvent {
  final RegisterRequest registerRequest;

  RegisterEvent({required this.registerRequest});

  @override
  List<Object> get props => [registerRequest];
}
