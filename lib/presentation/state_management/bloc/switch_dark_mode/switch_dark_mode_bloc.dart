import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'switch_dark_mode_event.dart';
part 'switch_dark_mode_state.dart';

class SwitchModeBloc extends Bloc<SwitchModeEvent, SwitchModeState> {
  SwitchModeBloc() : super(SwitchModeInitial()) {
    on<SwitchModeEvent>((event, emit) {
      if (state is SwitchOff) {
        emit(SwitchOn());
      } else {
        emit(SwitchOff());
      }
    });
  }
}
