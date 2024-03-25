import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gender_event.dart';
part 'gender_state.dart';

class GenderBloc extends Bloc<GenderEvent, GenderState> {
  GenderBloc() : super(MaleSelectedState()) {
    on<GenderEvent>((event, emit) {
      if (event is MaleSelected) {
        emit(MaleSelectedState());
      } else if (event is FemaleSelected) {
        emit(FemaleSelectedState());
      }
    });
  }
}
