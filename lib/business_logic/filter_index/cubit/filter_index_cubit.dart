import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filter_index_state.dart';

class FilterIndexCubit extends Cubit<FilterIndexState> {
  FilterIndexCubit() : super(FilterIndexInitial());
  void changeFilterIndex(index) => emit(FilterIndexChanged(index: index));
}
