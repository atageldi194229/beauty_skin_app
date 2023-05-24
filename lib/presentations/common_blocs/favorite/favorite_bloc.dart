import 'dart:async';

import 'package:beauty_skin/data/models/product/product_model.dart';
import 'package:beauty_skin/data/repositories/favorites_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

typedef FavoriteItemModel = ProductModel;

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoritesRepository _favoriteRepository = FavoritesRepository();
  FavoriteBloc() : super(FavoritesLoading()) {
    on<LoadFavorites>(_mapLoadFavoritesToState);
    on<AddFavoriteItemModel>(_mapAddCartItemModelToState);
    on<ClearFavorites>(_mapClearFavoritesToState);
    on<RemoveFavoriteItemModel>(_mapRemoveFavoriteItemModelToState);
  }

  FutureOr<void> _mapLoadFavoritesToState(
    LoadFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      final data = await _favoriteRepository.fetchCart();
      emit(FavoritesLoaded(products: data));
    } catch (e) {
      debugPrint(e.toString());
      emit(FavoritesLoadFailure(e.toString()));
    }
  }

  FutureOr<void> _mapAddCartItemModelToState(
    AddFavoriteItemModel event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      await _favoriteRepository.addCartItemModel(event.product);
      add(LoadFavorites());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  FutureOr<void> _mapClearFavoritesToState(
    ClearFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      await _favoriteRepository.clearCart();
      add(LoadFavorites());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  FutureOr<void> _mapRemoveFavoriteItemModelToState(
    RemoveFavoriteItemModel event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      await _favoriteRepository.removeCartItemModel(event.product);
      add(LoadFavorites());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
