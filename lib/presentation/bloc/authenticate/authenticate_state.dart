part of 'authenticate_bloc.dart';

sealed class AuthenticateState extends Equatable {
  const AuthenticateState();

  @override
  List<Object> get props => [];
}

final class AuthenticateInitial extends AuthenticateState {}

class ShowPasswordState extends AuthenticateState {}

class LoadingState extends AuthenticateState {}

class LoadingSuccessState extends AuthenticateState {}

class ErrorLoginState extends AuthenticateState {
  final String message;

  ErrorLoginState({required this.message});

  @override
  List<Object> get props => [message];
}
