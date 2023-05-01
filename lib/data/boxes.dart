// ignore_for_file: constant_identifier_names

import 'package:beauty_skin/data/models/cart_item_model.dart';
import 'package:beauty_skin/data/models/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes {
  // Hive box names
  static const _PRODUCTS = 'products';
  static const _CART = 'cart';

  // Register all adapters & Initialize all boxes
  static initBoxes() async {
    // Init Hive
    await Hive.initFlutter();

    // Register hive adapters
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(CartItemModelAdapter());

    // Open hive boxes
    await Hive.openBox<ProductModel>(_PRODUCTS);
    await Hive.openBox<CartItemModel>(_CART);
  }

  // static methods to get open hive boxes
  static Box<ProductModel> getProducts() => Hive.box<ProductModel>(_PRODUCTS);
  static Box<CartItemModel> getCart() => Hive.box<CartItemModel>(_CART);

  // Close all open hive boxes
  static close() {
    Hive.close();
  }
}
