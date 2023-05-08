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
    await Boxes.getCart().add(newItem);
  }

  /// Remove item
  /// [cartItem] is data of cart item
  Future<void> removeCartItemModel(CartItemModel cartItem) async {
    await cartItem.delete();
  }

  /// Remove cart item by cartItemId
  /// [cartItem.id] is ID of cart item
  Future<void> removeCartItemModelByProductId(String id) async {
    Boxes.getCart().values.firstWhere((e) => e.productId == id).delete();
  }

  /// Clear cart
  Future<void> clearCart() async {
    await Boxes.getCart().clear();
  }

  /// Update quantity
  /// [cartItem] is updated data of cart item
  Future<void> updateCartItemModel(CartItemModel cartItem) async {
    await cartItem.save();
  }

  ///Singleton factory
  static final CartRepository _instance = CartRepository._internal();
  factory CartRepository() => _instance;
  CartRepository._internal();
}
