part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

/// Loading
class CategoriesLoading extends CategoriesState {}

/// Adready data
class CategoriesLoaded extends CategoriesState {
  final CategoriesResponse categoriesResponse;

  const CategoriesLoaded({required this.categoriesResponse});

  @override
  List<Object> get props => [categoriesResponse];
}

/// Failure
class CategoriesLoadFailure extends CategoriesState {
  final String error;

  const CategoriesLoadFailure(this.error);
}
