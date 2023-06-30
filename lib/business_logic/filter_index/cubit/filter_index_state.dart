part of 'filter_index_cubit.dart';

@immutable
abstract class FilterIndexState {}

class FilterIndexInitial extends FilterIndexState {}

class FilterIndexChanged extends FilterIndexState {
  int index = 0;
  FilterIndexChanged({required this.index});
   @override
  List<Object> get props => [index];
}
