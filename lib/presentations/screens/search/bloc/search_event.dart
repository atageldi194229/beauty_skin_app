part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class OpenScreen extends SearchEvent {}

class QueryChanged extends SearchEvent {
  final String search;
  final int page;

  const QueryChanged({required this.search, required this.page});

  @override
  List<Object> get props => [search];
}
