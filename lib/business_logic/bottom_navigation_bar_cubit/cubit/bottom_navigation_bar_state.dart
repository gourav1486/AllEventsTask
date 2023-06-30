part of 'bottom_navigation_bar_cubit.dart';

abstract class BottomNavigationBarState extends Equatable {
  const BottomNavigationBarState();

  @override
  List<Object> get props => [];
}

class BottomNavigationBarInitial extends BottomNavigationBarState {}

class IndexChanged extends BottomNavigationBarState {
  late int index;
  IndexChanged({required this.index});
   @override
  List<Object> get props => [index];
}
