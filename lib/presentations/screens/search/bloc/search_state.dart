part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class Searching extends SearchState {}

class ResultsLoaded extends SearchState {
  final List<ProductModel2> results;

  const ResultsLoaded(this.results);

  @override
  List<Object> get props => [results];
}

class SearchFailure extends SearchState {
  final String error;

  const SearchFailure(this.error);

  @override
  List<Object> get props => [error];
}
