part of 'search_category_bloc.dart';

abstract class SearchCategoryState extends Equatable {
  const SearchCategoryState();

  @override
  List<Object> get props => [];
}

class SearchCategoryInitial extends SearchCategoryState {}

class SearchLoaded extends SearchCategoryState {
  List<CategoriesModel> categories = [];
  SearchLoaded({required this.categories});
  @override
  List<Object> get props => [categories];
}
