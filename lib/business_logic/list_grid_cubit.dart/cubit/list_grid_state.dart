part of 'list_grid_cubit.dart';

abstract class ListGridState extends Equatable {
  const ListGridState();

  @override
  List<Object> get props => [];
}

class ListGridInitial extends ListGridState {}

class Toggle extends ListGridState {
  bool listView = true;
  Toggle({required this.listView});
   @override
  List<Object> get props => [listView];
}
