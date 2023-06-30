import 'package:all_events_project/models/categories_model.dart';
import 'package:all_events_project/repositories/get_categoreies_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_categoreis_event.dart';
part 'get_categoreis_state.dart';

class GetCategoreisBloc extends Bloc<GetCategoreisEvent, GetCategoreisState> {
  final getCategoreisRepo = GetCategoriesRepo();
  GetCategoreisBloc() : super(GetCategoreisInitial()) {
    on<FetchCategories>((event, emit) async {
      try {
        var data = await getCategoreisRepo.getCategories();
        emit(CategoriesLoaded(categories: data));
      } catch (e) {
        emit(CategoriesError(error: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
