part of 'current_home_bloc.dart';

abstract class CurrentHomeState extends Equatable {
  const CurrentHomeState();

  @override
  List<Object> get props => [];
}

final class CurrentHomeInitial extends CurrentHomeState {
   final int currentIndex;

  const CurrentHomeInitial({required this.currentIndex});
 @override
  List<Object> get props => [currentIndex];
}

class SelectPageState extends CurrentHomeState {
  final int currentIndex;

  const SelectPageState({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}
