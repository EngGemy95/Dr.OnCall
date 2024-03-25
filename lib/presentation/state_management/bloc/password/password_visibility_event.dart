part of 'password_visibility_bloc.dart';

abstract class PasswordVisibilityEvent extends Equatable {
  const PasswordVisibilityEvent();
}

class TogglePasswordVisibility extends PasswordVisibilityEvent {
  @override
  List<Object?> get props => [];
}
