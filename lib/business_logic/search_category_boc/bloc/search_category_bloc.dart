import 'package:all_events_project/models/categories_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_category_event.dart';
part 'search_category_state.dart';

class SearchCategoryBloc
    extends Bloc<SearchCategoryEvent, SearchCategoryState> {
  SearchCategoryBloc() : super(SearchCategoryInitial()) {
    on<Search>((event, emit) {
      List<CategoriesModel> sortedList = [];
      // TODO: implement event handler
      try {
        sortedList.clear();
       
        event.categories.forEach((element) {
          if (element.category.contains(event.searchText)) {
            sortedList.add(element);
          }
        });
        emit(SearchLoaded(categories: sortedList));
      } catch (e) {}
    });
  }
}
