// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  final String fullName;
  final String phoneNumber;
  final String address;
  final String comment;
  final List<OrderModelItem> products;

  const OrderModel({
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.comment,
    required this.products,
  });

  OrderModel copyWith({
    String? fullName,
    String? phoneNumber,
    String? address,
    String? comment,
    List<OrderModelItem>? products,
  }) {
    return OrderModel(
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      comment: comment ?? this.comment,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'full_name': fullName,
      'phone_number': phoneNumber,
      'address': address,
      'comment': comment,
      'products': products.map((x) => "${x.productId},${x.quantity};").join(""),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      fullName: map['full_name'] as String,
      phoneNumber: map['phone_number'] as String,
      address: map['address'] as String,
      comment: map['comment'] as String,
      products: List<OrderModelItem>.from(
        (map['products'] as List<int>).map<OrderModelItem>(
          (x) => OrderModelItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      fullName,
      phoneNumber,
      address,
      comment,
      products,
    ];
  }
}

class OrderModelItem extends Equatable {
  final String productId;
  final String productName;
  final double productPrice;
  final String productImage;
  final int quantity;

  const OrderModelItem({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.quantity,
  });

  OrderModelItem copyWith({
    String? productId,
    String? productName,
    double? productPrice,
    String? productImage,
    int? quantity,
  }) {
    return OrderModelItem(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      productImage: productImage ?? this.productImage,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productName': productName,
      'productPrice': productPrice,
      'productImage': productImage,
      'quantity': quantity,
    };
  }

  factory OrderModelItem.fromMap(Map<String, dynamic> map) {
    return OrderModelItem(
      productId: map['productId'] as String,
      productName: map['productName'] as String,
      productPrice: map['productPrice'] as double,
      productImage: map['productImage'] as String,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModelItem.fromJson(String source) => OrderModelItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      productId,
      productName,
      productPrice,
      productImage,
      quantity,
    ];
  }
}
