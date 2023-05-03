// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:beauty_skin/constants/constants.dart';

class BannerModel extends Equatable {
  final int id;
  final String imagePath;

  get imageUrl => "$kBaseUrl/$imagePath-big.webp";

  const BannerModel({
    required this.id,
    required this.imagePath,
  });

  BannerModel copyWith({
    int? id,
    String? imagePath,
  }) {
    return BannerModel(
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imagePath': imagePath,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id'] as int,
      imagePath: map['destination'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerModel.fromJson(String source) =>
      BannerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, imagePath];
}
