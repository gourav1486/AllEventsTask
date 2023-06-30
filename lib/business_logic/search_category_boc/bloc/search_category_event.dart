part of 'search_category_bloc.dart';

abstract class SearchCategoryEvent extends Equatable {
  const SearchCategoryEvent();

  @override
  List<Object> get props => [];
}

class Search extends SearchCategoryEvent {
  late String searchText;
  late List<CategoriesModel> categories;
  Search({required this.categories, required this.searchText});
   @override
  List<Object> get props => [searchText,categories];
}
