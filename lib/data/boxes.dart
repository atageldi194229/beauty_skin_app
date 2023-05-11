// ignore_for_file: constant_identifier_names

import 'package:beauty_skin/data/models/cart_item_model.dart';
import 'package:beauty_skin/data/models/product/product_model2.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes {
  // Hive box names
  static const _PRODUCTS2 = 'products2';
  static const _CART = 'cart';

  // Register all adapters & Initialize all boxes
  static initBoxes() async {
    // Init Hive
    await Hive.initFlutter();

    // Register hive adapters
    Hive.registerAdapter(ProductModel2Adapter());
    Hive.registerAdapter(CartItemModelAdapter());

    // Open hive boxes
    await Hive.openBox<ProductModel2>(_PRODUCTS2);
    await Hive.openBox<CartItemModel>(_CART);
  }

  // static methods to get open hive boxes
  static Box<ProductModel2> getProducts2() =>
      Hive.box<ProductModel2>(_PRODUCTS2);
  static Box<CartItemModel> getCart() => Hive.box<CartItemModel>(_CART);

  // Close all open hive boxes
  static close() {
    Hive.close();
  }
}
