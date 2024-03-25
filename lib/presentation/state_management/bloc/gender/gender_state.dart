part of 'gender_bloc.dart';

sealed class GenderState extends Equatable {
  const GenderState();

  @override
  List<Object> get props => [];
}

final class ChooseCheckBoxInitial extends GenderState {}

class MaleSelectedState extends GenderState {
  @override
  List<Object> get props => [];
}

class FemaleSelectedState extends GenderState {
  @override
  List<Object> get props => [];
}
