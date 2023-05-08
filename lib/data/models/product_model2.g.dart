// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model2.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModel2Adapter extends TypeAdapter<ProductModel2> {
  @override
  final int typeId = 2;

  @override
  ProductModel2 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel2(
      id: fields[0] as int?,
      minValue: fields[1] as int?,
      discountValue: fields[2] as int?,
      stockCount: fields[3] as int?,
      productName: fields[4] as String?,
      price: fields[5] as String?,
      imagePath: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel2 obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.minValue)
      ..writeByte(2)
      ..write(obj.discountValue)
      ..writeByte(3)
      ..write(obj.stockCount)
      ..writeByte(4)
      ..write(obj.productName)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModel2Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
