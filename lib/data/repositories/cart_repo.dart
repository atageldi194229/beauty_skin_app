import 'package:beauty_skin/data/boxes.dart';
import 'package:beauty_skin/data/models/cart_item_model.dart';

class CartRepository {
  /// Cart stream
  Future<List<CartItemModel>> fetchCart() async {
    return Boxes.getCart().values.toList();
  }

  /// Add item
  /// [newItem] is data of new cart item
  Future<void> addCartItemModel(CartItemModel newItem) async {
    Boxes.getCart().add(newItem);
  }

  /// Remove item
  /// [cartItem] is data of cart item
  Future<void> removeCartItemModel(CartItemModel cartItem) async {
    cartItem.delete();
  }

  /// Clear cart
  Future<void> clearCart() async {
    Boxes.getCart().clear();
  }

  /// Update quantity
  /// [cartItem] is updated data of cart item
  Future<void> updateCartItemModel(CartItemModel cartItem) async {
    cartItem.save();
  }

  ///Singleton factory
  static final CartRepository _instance = CartRepository._internal();
  factory CartRepository() => _instance;
  CartRepository._internal();
}
