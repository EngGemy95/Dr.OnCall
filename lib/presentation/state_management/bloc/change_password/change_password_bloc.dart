import 'package:dr_on_call/domain/usecase/update_password_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/requests/update_password/update_password_request.dart';
import '../../../../utils/app_prefs.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final UpdatePasswordUseCase updatePasswordUseCase;
  final AppPreference appPreference;

  ChangePasswordBloc(
      {required this.updatePasswordUseCase, required this.appPreference})
      : super(ChangePasswordInitial()) {
    on<ChangePasswordEvent>((event, emit) async {
      if (event is UpdatePasswordEvent) {
        emit(ChangePasswordLoadingState());

        final response =
            await updatePasswordUseCase.call(event.updatePasswordRequest);
        await response.fold((failure) {
          emit(ErrorUpdatePasswordState(message: failure.message));
        }, (changePasswordModel) async {
          if (changePasswordModel.status >= 200 && changePasswordModel.status < 300) {
            emit(UpdatePasswordSuccessState());
          } else {
            emit(
                ErrorUpdatePasswordState(message: changePasswordModel.message));
          }
        });
      }
    });
  }
}
