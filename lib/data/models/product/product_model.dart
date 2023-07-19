// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:beauty_skin/localization/translate.dart';

part 'product_model.g.dart';
part 'product_model_extension.dart';

@HiveType(typeId: 4)
class ProductModel extends Equatable with HiveObjectMixin {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int catId;
  @HiveField(2)
  final int subCatId;
  @HiveField(3)
  final int? brandId;
  @HiveField(4)
  final String nameTk;
  @HiveField(5)
  final String nameRu;
  @HiveField(6)
  final String contentTk;
  @HiveField(7)
  final String contentRu;
  @HiveField(8)
  final String? img1;
  @HiveField(9)
  final String? img2;
  @HiveField(10)
  final String? img3;
  @HiveField(11)
  final String? img4;
  @HiveField(12)
  final double price;
  @HiveField(13)
  final double skidka;
  @HiveField(14)
  final int views;
  @HiveField(15)
  final String createdAt;

  ProductModel({
    required this.id,
    required this.catId,
    required this.subCatId,
    this.brandId,
    required this.nameTk,
    required this.nameRu,
    required this.contentTk,
    required this.contentRu,
    this.img1,
    this.img2,
    this.img3,
    this.img4,
    required this.price,
    required this.skidka,
    required this.views,
    required this.createdAt,
  });

  ProductModel copyWith({
    int? id,
    int? catId,
    int? subCatId,
    int? brandId,
    String? nameTk,
    String? nameRu,
    String? contentTk,
    String? contentRu,
    String? img1,
    String? img2,
    String? img3,
    String? img4,
    double? price,
    double? skidka,
    int? views,
    String? createdAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      catId: catId ?? this.catId,
      subCatId: subCatId ?? this.subCatId,
      brandId: brandId ?? this.brandId,
      nameTk: nameTk ?? this.nameTk,
      nameRu: nameRu ?? this.nameRu,
      contentTk: contentTk ?? this.contentTk,
      contentRu: contentRu ?? this.contentRu,
      img1: img1 ?? this.img1,
      img2: img2 ?? this.img2,
      img3: img3 ?? this.img3,
      img4: img4 ?? this.img4,
      price: price ?? this.price,
      skidka: skidka ?? this.skidka,
      views: views ?? this.views,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cat_id': catId,
      'sub_cat_id': subCatId,
      'brand_id': brandId,
      'name_tk': nameTk,
      'name_ru': nameRu,
      'content_tk': contentTk,
      'content_ru': contentRu,
      'img1': img1,
      'img2': img2,
      'img3': img3,
      'img4': img4,
      'price': price,
      'skidka': skidka,
      'views': views,
      'created_at': createdAt,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      catId: map['cat_id'] != null ? map['cat_id'] as int : 0,
      subCatId: (map['sub_cat_id'] ?? map['subcat_id']) as int,
      brandId: map['brand_id'] != null ? map['brand_id'] as int : null,
      nameTk: map['name_tk'] as String,
      nameRu: map['name_ru'] as String,
      contentTk: map['content_tk'] as String,
      contentRu: map['content_ru'] as String,
      img1: map['img1'] != null ? map['img1'] as String : null,
      img2: map['img2'] != null ? map['img2'] as String : null,
      img3: map['img3'] != null ? map['img3'] as String : null,
      img4: map['img4'] != null ? map['img4'] as String : null,
      price: double.tryParse(map['price'].toString()) ?? int.tryParse(map['price'].toString())?.toDouble() ?? -1.0,
      skidka: (map['skidka'] is int) ? (map['skidka'] as int).toDouble() : map['skidka'] as double,
      views: map['views'] as int,
      createdAt: map['created_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      catId,
      subCatId,
      brandId,
      nameTk,
      nameRu,
      contentTk,
      contentRu,
      img1,
      img2,
      img3,
      img4,
      price,
      skidka,
      views,
      createdAt,
    ];
  }
}
