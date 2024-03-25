import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'current_home_event.dart';
part 'current_home_state.dart';

class CurrentHomeBloc extends Bloc<CurrentHomeEvent, CurrentHomeState> {
  CurrentHomeBloc() : super(const CurrentHomeInitial(currentIndex: 0)) {
    on<CurrentHomeEvent>((event, emit) {
      if (event is SelectPageEvent) {
        emit(SelectPageState(currentIndex: event.currentPageIndex));
      }
    });
  }
}
