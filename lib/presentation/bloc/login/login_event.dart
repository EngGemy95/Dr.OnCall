part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class SignInEvent extends LoginEvent {
  final LoginRequest loginRequest;

  const SignInEvent({required this.loginRequest});

  @override
  List<Object> get props => [loginRequest];
}
