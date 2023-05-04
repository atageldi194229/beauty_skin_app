import 'dart:convert';

import 'package:beauty_skin/constants/constants.dart';
import 'package:equatable/equatable.dart';

class ProductModel2 extends Equatable {
  final int? id;
  final int? minValue;
  final int? discountValue;
  final int? stockCount;
  final String? productName;
  final String? price;
  final String? imagePath;

  get imageUrl => "$kBaseUrl/$imagePath-big.webp";

  const ProductModel2({
    this.id,
    this.minValue,
    this.discountValue,
    this.stockCount,
    this.productName,
    this.price,
    this.imagePath,
  });

  ProductModel2 copyWith({
    int? id,
    int? minValue,
    int? discountValue,
    int? stockCount,
    String? productName,
    String? price,
    String? imagePath,
  }) {
    return ProductModel2(
      id: id ?? this.id,
      minValue: minValue ?? this.minValue,
      discountValue: discountValue ?? this.discountValue,
      stockCount: stockCount ?? this.stockCount,
      productName: productName ?? this.productName,
      price: price ?? this.price,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'minValue': minValue,
      'discountValue': discountValue,
      'stockCount': stockCount,
      'productName': productName,
      'price': price,
      'imagePath': imagePath,
    };
  }

  factory ProductModel2.fromMap(Map<String, dynamic> map) {
    return ProductModel2(
      id: map['id'] != null ? map['id'] as int : null,
      minValue: map['minValue'] != null ? map['minValue'] as int : null,
      discountValue:
          map['discountValue'] != null ? map['discountValue'] as int : null,
      stockCount: map['stockCount'] != null ? map['stockCount'] as int : null,
      productName: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      imagePath:
          map['destination'] != null ? map['destination'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel2.fromJson(String source) =>
      ProductModel2.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      minValue,
      discountValue,
      stockCount,
      productName,
      price,
      imagePath,
    ];
  }
}
