import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'password_visibility_event.dart';
part 'password_visibility_state.dart';

class PasswordVisibilityBloc
    extends Bloc<PasswordVisibilityEvent, PasswordVisibilityState> {
  PasswordVisibilityBloc() : super(PasswordHidden()) {
    on<PasswordVisibilityEvent>((event, emit) {
      if (state is PasswordHidden) {
        emit(PasswordVisible());
      } else {
        emit(PasswordHidden());
      }
    });
  }
}
