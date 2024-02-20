import 'package:bloc/bloc.dart';
import 'package:blood_donation/data/requests/login_request.dart';
import 'package:blood_donation/data/requests/register_request.dart';
import 'package:blood_donation/domain/usecase/login_usecase.dart';
import 'package:equatable/equatable.dart';

part 'authenticate_event.dart';
part 'authenticate_state.dart';

class AuthenticateBloc extends Bloc<AuthenticateEvent, AuthenticateState> {
  final LoginUseCase loginUseCase;

  AuthenticateBloc({required this.loginUseCase})
      : super(AuthenticateInitial()) {
    on<AuthenticateEvent>((event, emit) async {
      if (event is ShowPasswordEvent) {
        emit(ShowPasswordState());
      } else if (event is LoginEvent) {
        emit(LoadingState());
        final response = await loginUseCase(event.loginRequest);
        response.fold((failure) {
          emit(ErrorLoginState(message: failure.message));
        }, (apiModel) {
          emit(LoadingSuccessState());
        });
      } else if (event is RegisterEvent) {}
    });
  }
}
