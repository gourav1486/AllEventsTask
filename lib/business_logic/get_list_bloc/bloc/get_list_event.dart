part of 'get_list_bloc.dart';

abstract class GetListEvent extends Equatable {
  const GetListEvent();

  @override
  List<Object> get props => [];
}

class FetchEventList extends GetListEvent {
  late String url;
  FetchEventList({required this.url});
   @override
  List<Object> get props => [url];
}
