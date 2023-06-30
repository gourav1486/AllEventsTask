import 'package:all_events_project/models/event_list_model.dart';
import 'package:all_events_project/repositories/get_event_list_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_list_event.dart';
part 'get_list_state.dart';

class GetListBloc extends Bloc<GetListEvent, GetListState> {
  final getEventListRepo = GetEventListRepo();
  GetListBloc() : super(GetListInitial()) {
    on<FetchEventList>((event, emit) async {
      // TODO: implement event handler
      try {
        var data = await getEventListRepo.getEventList(event.url);
        emit(ListLoaded(eventList: data));
      } catch (e) {
        emit(ListLadingError(e: e.toString()));
      }
    });
  }
}
