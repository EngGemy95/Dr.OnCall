import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/requests/login_request.dart';
import '../../../domain/usecase/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class SignInBloc extends Bloc<LoginEvent, SignInState> {
  final LoginUseCase loginUseCase;

  SignInBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is SignInEvent) {
        emit(LoginLoadingState());
        final response = await loginUseCase(event.loginRequest);
        response.fold((failure) {
          print("errrrrrrrrrrorrrrrrrrrrrrr");
          emit(ErrorLoginState(message: failure.message));
        }, (apiModel) {
          print("Suuuuuuuuuuuuccccccrsssssssssssss");
          emit(LoginSuccessState());
        });
      }
    });
  }
}
