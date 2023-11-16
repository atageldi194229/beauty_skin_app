// ignore_for_file: constant_identifier_names

import 'package:beauty_skin/data/models/brand/brand_model.dart';
import 'package:beauty_skin/data/models/cart_item_model.dart';
import 'package:beauty_skin/data/models/delivery_address_model.dart';
import 'package:beauty_skin/data/models/product/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes {
  // Hive box names
  static const _PRODUCTS2 = 'products2';
  static const _CART = 'cart';
  static const _FAVORITES = 'favorites';
  static const _DELIVERY_ADDRESS_LIST = 'delivery_address_list';
  static const _SETTINGS = 'settings';
  static const _ORDERS = 'orders';

  // Register all adapters & Initialize all boxes
  static initBoxes() async {
    // Init Hive
    await Hive.initFlutter();

    // Register hive adapters
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(CartItemModelAdapter());
    Hive.registerAdapter(DeliveryAddressModelAdapter());
    Hive.registerAdapter(BrandModelAdapter());

    // Open hive boxes
    await Hive.openBox(_SETTINGS);
    await Hive.openBox<ProductModel>(_PRODUCTS2);
    await Hive.openBox<CartItemModel>(_CART);
    await Hive.openBox<ProductModel>(_FAVORITES);
    await Hive.openBox<DeliveryAddressModel>(_DELIVERY_ADDRESS_LIST);
    await Hive.openBox<int>(_ORDERS);
  }

  // static methods to get open hive boxes
  static Box getSettings() => Hive.box(_SETTINGS);

  static Box<ProductModel> getProducts2() {
    return Hive.box<ProductModel>(_PRODUCTS2);
  }

  static Box<CartItemModel> getCart() {
    return Hive.box<CartItemModel>(_CART);
  }

  static Box<ProductModel> getFavorites() {
    return Hive.box<ProductModel>(_FAVORITES);
  }

  static Box<DeliveryAddressModel> getDeliveryAddressList() {
    return Hive.box<DeliveryAddressModel>(_DELIVERY_ADDRESS_LIST);
  }

  static Box<int> getOrders() => Hive.box(_ORDERS);

  // Close all open hive boxes
  static close() {
    Hive.close();
  }
}

enum Setting {
  phoneNumber,
  username,
  language,
}
