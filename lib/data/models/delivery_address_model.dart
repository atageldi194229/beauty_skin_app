// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, unnecessary_this
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'delivery_address_model.g.dart';

@HiveType(typeId: 3)
class DeliveryAddressModel extends Equatable with HiveObjectMixin {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String address;

  @HiveField(2)
  final String uuid;

  DeliveryAddressModel({
    required this.name,
    required this.address,
    String? uuid,
  }) : this.uuid = uuid ?? const Uuid().v4();

  DeliveryAddressModel copyWith({
    String? name,
    String? address,
    String? uuid,
  }) {
    return DeliveryAddressModel(
      name: name ?? this.name,
      address: address ?? this.address,
      uuid: uuid ?? this.uuid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'address': address,
      'uuid': uuid,
    };
  }

  factory DeliveryAddressModel.fromMap(Map<String, dynamic> map) {
    return DeliveryAddressModel(
      name: map['name'] as String,
      address: map['address'] as String,
      uuid: map['uuid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryAddressModel.fromJson(String source) =>
      DeliveryAddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, address, uuid];
}
