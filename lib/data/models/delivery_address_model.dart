// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'delivery_address_model.g.dart';

@HiveType(typeId: 3)
class DeliveryAddressModel extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String address;

  const DeliveryAddressModel({
    required this.name,
    required this.address,
  });

  DeliveryAddressModel copyWith({
    String? name,
    String? address,
  }) {
    return DeliveryAddressModel(
      name: name ?? this.name,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'address': address,
    };
  }

  factory DeliveryAddressModel.fromMap(Map<String, dynamic> map) {
    return DeliveryAddressModel(
      name: map['name'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryAddressModel.fromJson(String source) =>
      DeliveryAddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, address];
}
