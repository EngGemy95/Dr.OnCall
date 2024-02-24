part of 'login_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();
}

final class LoginInitial extends SignInState {
  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends SignInState {
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends SignInState {
  @override
  List<Object?> get props => [];
}

class ErrorLoginState extends SignInState {
  final String message;

  const ErrorLoginState({required this.message});

  @override
  List<Object> get props => [message];
}
