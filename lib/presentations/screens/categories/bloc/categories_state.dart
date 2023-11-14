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
  final List<BrandModel> brands;

  const CategoriesLoaded({
    required this.categoriesResponse,
    required this.brands,
  });

  @override
  List<Object> get props => [categoriesResponse, brands];
}

/// Failure
class CategoriesLoadFailure extends CategoriesState {
  final String error;

  const CategoriesLoadFailure(this.error);
}
