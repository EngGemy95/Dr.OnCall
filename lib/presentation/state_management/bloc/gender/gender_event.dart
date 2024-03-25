part of 'gender_bloc.dart';

abstract class GenderEvent extends Equatable {
  const GenderEvent();

  @override
  List<Object> get props => [];
}

class MaleSelected extends GenderEvent {
  @override
  List<Object> get props => [];
}

class FemaleSelected extends GenderEvent {
  @override
  List<Object> get props => [];
}
