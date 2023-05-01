import 'dart:async';

import 'package:beauty_skin/data/models/cart_item_model.dart';
import 'package:beauty_skin/data/repositories/cart_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show debugPrint;

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository = CartRepository();

  CartBloc() : super(CartLoading()) {
    on<LoadCart>(_mapLoadCartToState);
    on<AddCartItemModel>(_mapAddCartItemModelToState);
    on<UpdateCartItemModel>(_mapUpdateCartItemModelToState);
    on<ClearCart>(_mapClearCartToState);
    on<CartUpdated>(_mapCartUpdatedToState);
  }

  _mapLoadCartToState(LoadCart event, Emitter<CartState> emit) async {
    try {
      final cart = await _cartRepository.fetchCart();
      add(CartUpdated(cart));
    } catch (e) {
      emit(CartLoadFailure(e.toString()));
    }
  }

  _mapAddCartItemModelToState(
    AddCartItemModel event,
    Emitter<CartState> emit,
  ) async {
    try {
      await _cartRepository.addCartItemModel(event.cartItem);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _mapUpdateCartItemModelToState(
    UpdateCartItemModel event,
    Emitter<CartState> emit,
  ) async {
    try {
      await _cartRepository.updateCartItemModel(event.cartItem);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  FutureOr<void> _mapClearCartToState(
    ClearCart event,
    Emitter<CartState> emit,
  ) async {
    try {
      await _cartRepository.clearCart();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  FutureOr<void> _mapCartUpdatedToState(
    CartUpdated event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());

    final updatedCart = event.updatedCart;
    int priceOfGoods = 0;

    for (int i = 0; i < updatedCart.length; i++) {
      priceOfGoods += updatedCart[i].price;
    }

    emit(CartLoaded(
      cart: updatedCart,
      priceOfGoods: priceOfGoods,
    ));
  }
}
