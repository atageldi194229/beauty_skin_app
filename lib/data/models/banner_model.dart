// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

class BannerModel extends Equatable {
  final int id;
  final String? nameTk;
  final String? nameRu;
  final String? contentTk;
  final String? contectRu;
  final String imgPath;
  final int views;
  final String createdAt;
  final String updatedAt;

  String get imageUrl => imgPath.replaceAll(
      RegExp(r'http://216.250.8.137/'), 'http://216.250.8.137:5000/');

  const BannerModel({
    required this.id,
    this.nameTk,
    this.nameRu,
    this.contentTk,
    this.contectRu,
    required this.imgPath,
    required this.views,
    required this.createdAt,
    required this.updatedAt,
  });

  BannerModel copyWith({
    int? id,
    String? nameTk,
    String? nameRu,
    String? contentTk,
    String? contectRu,
    String? imgPath,
    int? views,
    String? createdAt,
    String? updatedAt,
  }) {
    return BannerModel(
      id: id ?? this.id,
      nameTk: nameTk ?? this.nameTk,
      nameRu: nameRu ?? this.nameRu,
      contentTk: contentTk ?? this.contentTk,
      contectRu: contectRu ?? this.contectRu,
      imgPath: imgPath ?? this.imgPath,
      views: views ?? this.views,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name_tk': nameTk,
      'name_ru': nameRu,
      'content_tk': contentTk,
      'contect_ru': contectRu,
      'img_path': imgPath,
      'views': views,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id'] as int,
      nameTk: map['name_tk'] != null ? map['name_tk'] as String : null,
      nameRu: map['name_ru'] != null ? map['name_ru'] as String : null,
      contentTk: map['content_tk'] != null ? map['content_tk'] as String : null,
      contectRu: map['contect_ru'] != null ? map['contect_ru'] as String : null,
      imgPath: map['img_path'] as String,
      views: map['views'] as int,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerModel.fromJson(String source) =>
      BannerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      nameTk,
      nameRu,
      contentTk,
      contectRu,
      imgPath,
      views,
      createdAt,
      updatedAt,
    ];
  }
}
