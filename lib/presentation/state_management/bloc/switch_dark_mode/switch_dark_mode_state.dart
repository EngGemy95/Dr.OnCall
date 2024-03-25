part of 'switch_dark_mode_bloc.dart';

abstract class SwitchModeState extends Equatable {
  const SwitchModeState();

  @override
  List<Object> get props => [];
}

final class SwitchModeInitial extends SwitchModeState {}

class SwitchOn extends SwitchModeState {
  @override
  List<Object> get props => [];
}

class SwitchOff extends SwitchModeState {
  @override
  List<Object> get props => [];
}
