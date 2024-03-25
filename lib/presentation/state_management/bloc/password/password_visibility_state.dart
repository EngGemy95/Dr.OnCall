part of 'password_visibility_bloc.dart';

abstract class PasswordVisibilityState extends Equatable {
  const PasswordVisibilityState();
}

class PasswordVisibilityInitial extends PasswordVisibilityState {
  @override
  List<Object> get props => [];
}

class PasswordVisible extends PasswordVisibilityState {
  @override
  List<Object?> get props => [];
}

class PasswordHidden extends PasswordVisibilityState {
  @override
  List<Object?> get props => [];
}
