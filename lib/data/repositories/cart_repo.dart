import 'dart:async';

import 'package:beauty_skin/data/boxes.dart';
import 'package:beauty_skin/data/models/cart_item_model.dart';
import 'package:beauty_skin/data/models/product/product_model.dart';

class CartRepository {
  /// Cart stream
  Future<List<CartItemModel>> fetchCart() async {
    return Boxes.getCart().values.toList();
  }

  /// Add item
  /// [newItem] is data of new cart item
  Future<void> addCartItemModel(CartItemModel newItem) async {
    await Boxes.getCart().add(newItem);
  }

  /// Remove item
  /// [cartItem] is data of cart item
  Future<void> removeCartItemModel(CartItemModel cartItem) async {
    await cartItem.delete();
  }

  /// Remove cart item by cartItemId
  /// [cartItem.id] is ID of cart item
  Future<void> removeCartItemModelByProductId(ProductModel product) async {
    return Boxes.getCart()
        .values
        .firstWhere((e) => e.productInfo == product)
        .delete();
  }

  /// Clear cart
  Future<void> clearCart() async {
    await Boxes.getCart().clear();
  }

  /// Update quantity
  /// [cartItem] is updated data of cart item
  Future<void> updateCartItemModel(CartItemModel cartItem) async {
    final cartBox = Boxes.getCart();

    for (var key in cartBox.keys) {
      final a = cartBox.get(key);
      if (a != null && a.productInfo == cartItem.productInfo) {
        await cartBox.put(key, cartItem);
      }
    }
  }

  ///Singleton factory
  static final CartRepository _instance = CartRepository._internal();
  factory CartRepository() => _instance;
  CartRepository._internal();
}
