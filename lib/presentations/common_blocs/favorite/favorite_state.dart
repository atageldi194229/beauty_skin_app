part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoritesLoading extends FavoriteState {}

/// Favorites was loaded
class FavoritesLoaded extends FavoriteState {
  final List<FavoriteItemModel> products;

  const FavoritesLoaded({
    required this.products,
  });

  @override
  List<Object> get props => [products];
}

/// Favorites wasn't loaded
class FavoritesLoadFailure extends FavoriteState {
  final String error;

  const FavoritesLoadFailure(this.error);

  @override
  List<Object> get props => [error];
}
