part of 'get_list_bloc.dart';

abstract class GetListState extends Equatable {
  const GetListState();

  @override
  List<Object> get props => [];
}

class GetListInitial extends GetListState {}

class ListLoaded extends GetListState {
  late EventListModel eventList;
  ListLoaded({required this.eventList});
  @override
  List<Object> get props => [eventList];
}

class ListLadingError extends GetListState {
  late String e;
  ListLadingError({required this.e});
   @override
  List<Object> get props => [e];
}
