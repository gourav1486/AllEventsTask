part of 'get_categoreis_bloc.dart';

abstract class GetCategoreisState extends Equatable {
  const GetCategoreisState();

  @override
  List<Object> get props => [];
}

class GetCategoreisInitial extends GetCategoreisState {}

class CategoriesLoaded extends GetCategoreisState {
  late List<CategoriesModel> categories;
  CategoriesLoaded({required this.categories});
  @override
  List<Object> get props => [categories];
}

class CategoriesError extends GetCategoreisState {
  late String error;
  CategoriesError({required this.error});
   @override
  List<Object> get props => [error];
}
