import 'package:Dr_OnCall/domain/usecase/register_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/requests/register_request.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterBloc({required this.registerUseCase}) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is SignUpEvent) {
        if (state is RegisterLoadingState) {
          emit(RegisterLoadingState());
          final response = await registerUseCase(event.registerRequest);
          response.fold((failure) {
            emit(RegisterErrorState(message: failure.message));
          }, (registerModel) {
            emit(RegisterSuccessState());
          });
        }
      }
    });
  }
}
