// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 4;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      id: fields[0] as int,
      catId: fields[1] as int,
      subCatId: fields[2] as int,
      brandId: fields[3] as int?,
      nameTk: fields[4] as String,
      nameRu: fields[5] as String,
      contentTk: fields[6] as String,
      contentRu: fields[7] as String,
      img1: fields[8] as String?,
      img2: fields[9] as String?,
      img3: fields[10] as String?,
      img4: fields[11] as String?,
      price: fields[12] as double,
      skidka: fields[13] as double,
      views: fields[14] as int,
      createdAt: fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.catId)
      ..writeByte(2)
      ..write(obj.subCatId)
      ..writeByte(3)
      ..write(obj.brandId)
      ..writeByte(4)
      ..write(obj.nameTk)
      ..writeByte(5)
      ..write(obj.nameRu)
      ..writeByte(6)
      ..write(obj.contentTk)
      ..writeByte(7)
      ..write(obj.contentRu)
      ..writeByte(8)
      ..write(obj.img1)
      ..writeByte(9)
      ..write(obj.img2)
      ..writeByte(10)
      ..write(obj.img3)
      ..writeByte(11)
      ..write(obj.img4)
      ..writeByte(12)
      ..write(obj.price)
      ..writeByte(13)
      ..write(obj.skidka)
      ..writeByte(14)
      ..write(obj.views)
      ..writeByte(15)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
