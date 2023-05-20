// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_address_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeliveryAddressModelAdapter extends TypeAdapter<DeliveryAddressModel> {
  @override
  final int typeId = 3;

  @override
  DeliveryAddressModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeliveryAddressModel(
      name: fields[0] as String,
      address: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DeliveryAddressModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeliveryAddressModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
