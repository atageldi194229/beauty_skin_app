// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:beauty_skin/localization/translate.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'category_model_extension.dart';

class CategoryModel extends Equatable {
  final int id;
  final String nameTk;
  final String nameRu;
  final String imagePath;
  final String createdAt;

  const CategoryModel({
    required this.id,
    required this.nameTk,
    required this.nameRu,
    required this.imagePath,
    required this.createdAt,
  });

  CategoryModel copyWith({
    int? id,
    String? nameTk,
    String? nameRu,
    String? imagePath,
    String? createdAt,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      nameTk: nameTk ?? this.nameTk,
      nameRu: nameRu ?? this.nameRu,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name_tk': nameTk,
      'name_ru': nameRu,
      'img_path': imagePath,
      'created_at': createdAt,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int,
      nameTk: map['name_tk'] as String,
      nameRu: map['name_ru'] as String,
      imagePath: map['img_path'] as String,
      createdAt: map['created_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      nameTk,
      nameRu,
      imagePath,
      createdAt,
    ];
  }
}
