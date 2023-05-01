// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'product_model.g.dart';
/*
Already used hive fields:
0 1 2 3 4 5 6 7 8
*/

/// ProductModel model
@HiveType(typeId: 0)
class ProductModel with HiveObjectMixin {
  /// ProductModel id
  @HiveField(0)
  final String id;

  /// CategoryModel id
  @HiveField(1)
  final String categoryId;

  /// ProductModel name
  @HiveField(2)
  final String name;

  /// ProductModel description
  @HiveField(3)
  final String description;

  /// ProductModel preview images
  @HiveField(4)
  final List<String> images;

  /// ProductModel quantity and sold quantity
  @HiveField(5)
  final int quantity;
  @HiveField(6)
  final int soldQuantity;

  /// Original price and percent-off sale
  @HiveField(7)
  final int originalPrice;
  @HiveField(8)
  final int percentOff;

  ProductModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.images,
    required this.quantity,
    required this.soldQuantity,
    required this.originalPrice,
    required this.percentOff,
  });

  ProductModel copyWith({
    String? id,
    String? categoryId,
    String? name,
    String? description,
    List<String>? images,
    int? quantity,
    int? soldQuantity,
    int? originalPrice,
    int? percentOff,
  }) {
    return ProductModel(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      description: description ?? this.description,
      images: images ?? this.images,
      quantity: quantity ?? this.quantity,
      soldQuantity: soldQuantity ?? this.soldQuantity,
      originalPrice: originalPrice ?? this.originalPrice,
      percentOff: percentOff ?? this.percentOff,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'categoryId': categoryId,
      'name': name,
      'description': description,
      'images': images,
      'quantity': quantity,
      'soldQuantity': soldQuantity,
      'originalPrice': originalPrice,
      'percentOff': percentOff,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      categoryId: map['categoryId'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      quantity: map['quantity'] as int,
      soldQuantity: map['soldQuantity'] as int,
      originalPrice: map['originalPrice'] as int,
      percentOff: map['percentOff'] as int,
      images: List<String>.from((map['images'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, categoryId: $categoryId, name: $name, description: $description, images: $images, quantity: $quantity, soldQuantity: $soldQuantity, originalPrice: $originalPrice, percentOff: $percentOff)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.categoryId == categoryId &&
        other.name == name &&
        other.description == description &&
        listEquals(other.images, images) &&
        other.quantity == quantity &&
        other.soldQuantity == soldQuantity &&
        other.originalPrice == originalPrice &&
        other.percentOff == percentOff;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categoryId.hashCode ^
        name.hashCode ^
        description.hashCode ^
        images.hashCode ^
        quantity.hashCode ^
        soldQuantity.hashCode ^
        originalPrice.hashCode ^
        percentOff.hashCode;
  }
}
