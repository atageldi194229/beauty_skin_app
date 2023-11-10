// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BrandModel {
  final int? id;
  final String? nameTk;
  final String? nameRu;
  final String? imagePath;

  BrandModel({
    this.id,
    this.nameTk,
    this.nameRu,
    this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name_tk': nameTk,
      'name_ru': nameRu,
      'img_path': imagePath,
    };
  }

  factory BrandModel.fromMap(Map<String, dynamic> map) {
    return BrandModel(
      id: map['id'] != null ? map['id'] as int : null,
      nameTk: map['name_tk'] != null ? map['name_tk'] as String : null,
      nameRu: map['name_ru'] != null ? map['name_ru'] as String : null,
      imagePath: map['img_path'] != null ? map['img_path'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BrandModel.fromJson(String source) =>
      BrandModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant BrandModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nameTk == nameTk &&
        other.nameRu == nameRu &&
        other.imagePath == imagePath;
  }

  @override
  int get hashCode {
    return id.hashCode ^ nameTk.hashCode ^ nameRu.hashCode ^ imagePath.hashCode;
  }
}
