import 'package:beauty_skin/data/boxes.dart';
import 'package:beauty_skin/data/models/product/product_model2.dart';

class FavoritesRepository {
  /// Cart stream
  Future<List<ProductModel2>> fetchCart() async {
    return Boxes.getFavorites().values.toList();
  }

  /// Add item
  /// [newItem] is data of new cart item
  Future<void> addCartItemModel(ProductModel2 newItem) async {
    await Boxes.getFavorites().add(newItem);
  }

  /// Remove item
  /// [cartItem] is data of cart item
  Future<void> removeCartItemModel(ProductModel2 cartItem) async {
    await cartItem.delete();
  }

  /// Clear cart
  Future<void> clearCart() async {
    await Boxes.getFavorites().clear();
  }

  /// Update quantity
  /// [cartItem] is updated data of cart item
  Future<void> updateCartItemModel(ProductModel2 cartItem) async {
    await cartItem.save();
  }

  ///Singleton factory
  static final FavoritesRepository _instance = FavoritesRepository._internal();
  factory FavoritesRepository() => _instance;
  FavoritesRepository._internal();
}
