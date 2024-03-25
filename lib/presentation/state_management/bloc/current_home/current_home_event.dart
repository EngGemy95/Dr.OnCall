part of 'current_home_bloc.dart';

abstract class CurrentHomeEvent extends Equatable {
  const CurrentHomeEvent();

  @override
  List<Object> get props => [];
}

class SelectPageEvent extends CurrentHomeEvent {
  final int currentPageIndex;

  const SelectPageEvent({required this.currentPageIndex});

  @override
  List<Object> get props => [currentPageIndex];
}
