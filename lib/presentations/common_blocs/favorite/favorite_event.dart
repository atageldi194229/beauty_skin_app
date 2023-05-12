part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavorites extends FavoriteEvent {}

class ClearFavorites extends FavoriteEvent {}

class AddFavoriteItemModel extends FavoriteEvent {
  final FavoriteItemModel product;

  const AddFavoriteItemModel(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFavoriteItemModel extends FavoriteEvent {
  final FavoriteItemModel product;

  const RemoveFavoriteItemModel(this.product);

  @override
  List<Object> get props => [product];
}
