import 'package:dr_on_call/utils/app_prefs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/requests/login/login_request.dart';
import '../../../../domain/usecase/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class SignInBloc extends Bloc<LoginEvent, SignInState> {
  final LoginUseCase loginUseCase;
  final AppPreference appPreference;

  SignInBloc({required this.loginUseCase, required this.appPreference})
      : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is SignInEvent) {
        emit(LoginLoadingState());
        final response = await loginUseCase.call(event.loginRequest);
        await response.fold((failure) {
          emit(ErrorLoginState(message: failure.message));
        }, (apiModel) async {
          if (apiModel.status == 200) {
          print(apiModel.data!.token!);
            await appPreference.setToken(apiModel.data!.token!);
            await appPreference.setUserData(userData: apiModel.data!);
            emit(LoginSuccessState());
          } else {
            emit(ErrorLoginState(message: apiModel.message));
          }
        });
      }
    });
  }
}
