// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import 'package:beauty_skin/data/models/product/product_model.dart';

class OrderResponseModel extends Equatable {
  final int? id;
  final String? bookIds;
  final String? fullName;
  final String? status;
  final String? phoneNumber;
  final String? toleg;
  final String? address;
  final String? comment;
  final String? createdAt;
  final String? updatedAt;
  final List<OrderItemModel>? products;

  String? get createdAtFormatted {
    if (createdAt == null) return null;
    final date = DateTime.parse(createdAt!);
    return DateFormat("yyyy-MM-dd HH:mm:ss").format(date);
  }

  const OrderResponseModel({
    this.id,
    this.bookIds,
    this.fullName,
    this.status,
    this.phoneNumber,
    this.toleg,
    this.address,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.products,
  });

  OrderResponseModel copyWith({
    int? id,
    String? bookIds,
    String? fullName,
    String? status,
    String? phoneNumber,
    String? toleg,
    String? address,
    String? comment,
    String? createdAt,
    String? updatedAt,
    List<OrderItemModel>? products,
  }) {
    return OrderResponseModel(
      id: id ?? this.id,
      bookIds: bookIds ?? this.bookIds,
      fullName: fullName ?? this.fullName,
      status: status ?? this.status,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      toleg: toleg ?? this.toleg,
      address: address ?? this.address,
      comment: comment ?? this.comment,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'book_ids': bookIds,
      'full_name': fullName,
      'status': status,
      'phone_number': phoneNumber,
      'toleg': toleg,
      'address': address,
      'comment': comment,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'products': products?.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderResponseModel.fromMap(Map<String, dynamic> map) {
    return OrderResponseModel(
      id: map['id'] != null ? map['id'] as int : null,
      bookIds: map['book_ids'] != null ? map['book_ids'] as String : null,
      fullName: map['full_name'] != null ? map['full_name'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      phoneNumber: map['phone_number'] != null ? map['phone_number'] as String : null,
      toleg: map['toleg'] != null ? map['toleg'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      comment: map['comment'] != null ? map['comment'] as String : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
      products: map['products'] != null
          ? List<OrderItemModel>.from(
              (map['products'] as List<dynamic>).map<OrderItemModel>(
                (x) => OrderItemModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderResponseModel.fromJson(String source) => OrderResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      bookIds,
      fullName,
      status,
      phoneNumber,
      toleg,
      address,
      comment,
      createdAt,
      updatedAt,
      products,
    ];
  }
}

class OrderItemModel extends Equatable {
  final int count;
  final ProductModel product;

  const OrderItemModel({
    required this.count,
    required this.product,
  });

  OrderItemModel copyWith({
    int? count,
    ProductModel? product,
  }) {
    return OrderItemModel(
      count: count ?? this.count,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'product': product.toMap(),
    };
  }

  factory OrderItemModel.fromMap(Map<String, dynamic> map) {
    return OrderItemModel(
      count: map['count'] as int,
      product: ProductModel.fromMap(map['product'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItemModel.fromJson(String source) => OrderItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [count, product];
}
