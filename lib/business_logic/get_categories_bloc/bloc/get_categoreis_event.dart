part of 'get_categoreis_bloc.dart';

abstract class GetCategoreisEvent extends Equatable {
  const GetCategoreisEvent();

  @override
  List<Object> get props => [];
}

class FetchCategories extends GetCategoreisEvent {
  FetchCategories();
}
