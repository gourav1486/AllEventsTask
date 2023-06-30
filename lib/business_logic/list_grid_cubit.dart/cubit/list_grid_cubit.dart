import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'list_grid_state.dart';

class ListGridCubit extends Cubit<ListGridState> {
  ListGridCubit() : super(ListGridInitial());
  void toggleView(bool value) => emit(Toggle(listView: value));
}
