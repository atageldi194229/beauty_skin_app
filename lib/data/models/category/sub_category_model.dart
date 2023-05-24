// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:beauty_skin/localization/translate.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'sub_category_model_extension.dart';

class SubCategoryModel extends Equatable {
  final int id;
  final int catId;
  final String nameTk;
  final String nameRu;
  final String imagePath;
  final String createdAt;

  const SubCategoryModel({
    required this.id,
    required this.catId,
    required this.nameTk,
    required this.nameRu,
    required this.imagePath,
    required this.createdAt,
  });

  SubCategoryModel copyWith({
    int? id,
    int? catId,
    String? nameTk,
    String? nameRu,
    String? imagePath,
    String? createdAt,
  }) {
    return SubCategoryModel(
      id: id ?? this.id,
      catId: catId ?? this.catId,
      nameTk: nameTk ?? this.nameTk,
      nameRu: nameRu ?? this.nameRu,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cat_id': catId,
      'name_tk': nameTk,
      'name_ru': nameRu,
      'img_path': imagePath,
      'created_at': createdAt,
    };
  }

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
      id: map['id'] as int,
      catId: map['cat_id'] as int,
      nameTk: map['name_tk'] as String,
      nameRu: map['name_ru'] as String,
      imagePath: map['img_path'] as String,
      createdAt: map['created_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCategoryModel.fromJson(String source) =>
      SubCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      catId,
      nameTk,
      nameRu,
      imagePath,
      createdAt,
    ];
  }
}
