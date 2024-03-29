part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

/// Cart loading
class CartLoading extends CartState {}

/// Cart was loaded
class CartLoaded extends CartState {
  final List<CartItemModel> cart;
  final double priceOfGoods;

  const CartLoaded({
    required this.cart,
    required this.priceOfGoods,
  });

  @override
  List<Object> get props => [cart, priceOfGoods];
}

/// When Cart item added successfully
class CartItemAdded extends CartState {}

/// When Cart item removed successfully
class CartItemRemoved extends CartState {}

/// Cart wasn't loaded
class CartLoadFailure extends CartState {
  final String error;

  const CartLoadFailure(this.error);

  @override
  List<Object> get props => [error];
}
