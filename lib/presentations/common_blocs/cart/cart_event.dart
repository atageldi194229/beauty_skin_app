part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

/// When open cart screen -> load cart event
class LoadCart extends CartEvent {}

/// When user clicks to a clear cart => clear cart event
class ClearCart extends CartEvent {}

/// Cart was cleared
class CartUpdated extends CartEvent {
  final List<CartItemModel> updatedCart;

  const CartUpdated(this.updatedCart);

  @override
  List<Object> get props => [updatedCart];
}

/// When user clicks to add button => add cart item event
class AddCartItemModel extends CartEvent {
  final CartItemModel cartItem;

  const AddCartItemModel(this.cartItem);

  @override
  List<Object> get props => [cartItem];
}

/// When user swipes to remove cart item => remove cart item event
class RemoveCartItemModel extends CartEvent {
  final CartItemModel cartItem;

  const RemoveCartItemModel(this.cartItem);

  @override
  List<Object> get props => [cartItem];
}

/// When user clicks to change quantity => update cart event
class UpdateCartItemModel extends CartEvent {
  final CartItemModel cartItem;

  const UpdateCartItemModel(this.cartItem);

  @override
  List<Object> get props => [cartItem];
}
