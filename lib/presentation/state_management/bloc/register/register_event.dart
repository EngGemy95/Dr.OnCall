part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class SignUpEvent extends RegisterEvent {
  final RegisterRequest registerRequest;

  const SignUpEvent({required this.registerRequest});

  @override
  List<Object> get props => [registerRequest];
}
