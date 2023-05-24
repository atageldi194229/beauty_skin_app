// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';

import 'package:beauty_skin/data/models/product/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'cart_item_model.g.dart';

/// Cart item model
@HiveType(typeId: 1)
class CartItemModel extends Equatable with HiveObjectMixin {
  /// Cart item id
  @HiveField(0)
  final String id;

  /// Product Id
  @HiveField(8)
  final int productId;

  /// Product quantity in the cart
  @HiveField(2)
  final int quantity;

  /// Product price * quantity
  // @HiveField(3)
  // final int price;

  @HiveField(7)
  final double price;

  /// Product info, only use in client side
  // @HiveField(5)
  // final ProductModel? productInfo;

  @HiveField(6)
  final ProductModel? productInfo;

  CartItemModel({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.price,
    this.productInfo,
  });

  CartItemModel copyWith({
    String? id,
    int? productId,
    int? quantity,
    double? price,
    ProductModel? productInfo,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      productInfo: productInfo ?? this.productInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productId': productId,
      'quantity': quantity,
      'price': price,
      'productInfo': productInfo?.toMap(),
    };
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      id: map['id'] as String,
      productId: map['productId'] as int,
      quantity: map['quantity'] as int,
      price: map['price'] as double,
      productInfo: map['productInfo'] != null
          ? ProductModel.fromMap(map['productInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemModel.fromJson(String source) =>
      CartItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      productId,
      quantity,
      price,
      productInfo,
    ];
  }
}
