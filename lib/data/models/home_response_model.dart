// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

extension HomeResponseModelExtension on HomeResponseModel {
  List<int> get subCategoryIds => [
        subCategoryId1,
        subCategoryId2,
        subCategoryId3,
        subCategoryId4,
        subCategoryId5,
        subCategoryId6,
        subCategoryId7,
        subCategoryId8,
        subCategoryId9,
        subCategoryId10,
        subCategoryId11,
        subCategoryId12,
        subCategoryId13,
        subCategoryId14,
        subCategoryId15,
        subCategoryId16,
      ].whereType<int>().toList();
}

class HomeResponseModel {
  final int? subCategoryId1;
  final int? subCategoryId2;
  final int? subCategoryId3;
  final int? subCategoryId4;
  final int? subCategoryId5;
  final int? subCategoryId6;
  final int? subCategoryId7;
  final int? subCategoryId8;
  final int? subCategoryId9;
  final int? subCategoryId10;
  final int? subCategoryId11;
  final int? subCategoryId12;
  final int? subCategoryId13;
  final int? subCategoryId14;
  final int? subCategoryId15;
  final int? subCategoryId16;

  HomeResponseModel({
    required this.subCategoryId1,
    required this.subCategoryId2,
    required this.subCategoryId3,
    required this.subCategoryId4,
    required this.subCategoryId5,
    required this.subCategoryId6,
    required this.subCategoryId7,
    required this.subCategoryId8,
    required this.subCategoryId9,
    required this.subCategoryId10,
    required this.subCategoryId11,
    required this.subCategoryId12,
    required this.subCategoryId13,
    required this.subCategoryId14,
    required this.subCategoryId15,
    required this.subCategoryId16,
  });

  HomeResponseModel copyWith({
    int? subCategoryId1,
    int? subCategoryId2,
    int? subCategoryId3,
    int? subCategoryId4,
    int? subCategoryId5,
    int? subCategoryId6,
    int? subCategoryId7,
    int? subCategoryId8,
    int? subCategoryId9,
    int? subCategoryId10,
    int? subCategoryId11,
    int? subCategoryId12,
    int? subCategoryId13,
    int? subCategoryId14,
    int? subCategoryId15,
    int? subCategoryId16,
  }) {
    return HomeResponseModel(
      subCategoryId1: subCategoryId1 ?? this.subCategoryId1,
      subCategoryId2: subCategoryId2 ?? this.subCategoryId2,
      subCategoryId3: subCategoryId3 ?? this.subCategoryId3,
      subCategoryId4: subCategoryId4 ?? this.subCategoryId4,
      subCategoryId5: subCategoryId5 ?? this.subCategoryId5,
      subCategoryId6: subCategoryId6 ?? this.subCategoryId6,
      subCategoryId7: subCategoryId7 ?? this.subCategoryId7,
      subCategoryId8: subCategoryId8 ?? this.subCategoryId8,
      subCategoryId9: subCategoryId9 ?? this.subCategoryId9,
      subCategoryId10: subCategoryId10 ?? this.subCategoryId10,
      subCategoryId11: subCategoryId11 ?? this.subCategoryId11,
      subCategoryId12: subCategoryId12 ?? this.subCategoryId12,
      subCategoryId13: subCategoryId13 ?? this.subCategoryId13,
      subCategoryId14: subCategoryId14 ?? this.subCategoryId14,
      subCategoryId15: subCategoryId15 ?? this.subCategoryId15,
      subCategoryId16: subCategoryId16 ?? this.subCategoryId16,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sub_cat_id1': subCategoryId1,
      'sub_cat_id2': subCategoryId2,
      'sub_cat_id3': subCategoryId3,
      'sub_cat_id4': subCategoryId4,
      'sub_cat_id5': subCategoryId5,
      'sub_cat_id6': subCategoryId6,
      'sub_cat_id7': subCategoryId7,
      'sub_cat_id8': subCategoryId8,
      'sub_cat_id9': subCategoryId9,
      'sub_cat_id10': subCategoryId10,
      'sub_cat_id11': subCategoryId11,
      'sub_cat_id12': subCategoryId12,
      'sub_cat_id13': subCategoryId13,
      'sub_cat_id14': subCategoryId14,
      'sub_cat_id15': subCategoryId15,
      'sub_cat_id16': subCategoryId16,
    };
  }

  factory HomeResponseModel.fromMap(Map<String, dynamic> map) {
    return HomeResponseModel(
      subCategoryId1:
          map['sub_cat_id1'] != null ? map['sub_cat_id1'] as int : null,
      subCategoryId2:
          map['sub_cat_id2'] != null ? map['sub_cat_id2'] as int : null,
      subCategoryId3:
          map['sub_cat_id3'] != null ? map['sub_cat_id3'] as int : null,
      subCategoryId4:
          map['sub_cat_id4'] != null ? map['sub_cat_id4'] as int : null,
      subCategoryId5:
          map['sub_cat_id5'] != null ? map['sub_cat_id5'] as int : null,
      subCategoryId6:
          map['sub_cat_id6'] != null ? map['sub_cat_id6'] as int : null,
      subCategoryId7:
          map['sub_cat_id7'] != null ? map['sub_cat_id7'] as int : null,
      subCategoryId8:
          map['sub_cat_id8'] != null ? map['sub_cat_id8'] as int : null,
      subCategoryId9:
          map['sub_cat_id9'] != null ? map['sub_cat_id9'] as int : null,
      subCategoryId10:
          map['sub_cat_id10'] != null ? map['sub_cat_id10'] as int : null,
      subCategoryId11:
          map['sub_cat_id11'] != null ? map['sub_cat_id11'] as int : null,
      subCategoryId12:
          map['sub_cat_id12'] != null ? map['sub_cat_id12'] as int : null,
      subCategoryId13:
          map['sub_cat_id13'] != null ? map['sub_cat_id13'] as int : null,
      subCategoryId14:
          map['sub_cat_id14'] != null ? map['sub_cat_id14'] as int : null,
      subCategoryId15:
          map['sub_cat_id15'] != null ? map['sub_cat_id15'] as int : null,
      subCategoryId16:
          map['sub_cat_id16'] != null ? map['sub_cat_id16'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeResponseModel.fromJson(String source) =>
      HomeResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HomeResponseModel(subCategoryId1: $subCategoryId1, subCategoryId2: $subCategoryId2, subCategoryId3: $subCategoryId3, subCategoryId4: $subCategoryId4, subCategoryId5: $subCategoryId5, subCategoryId6: $subCategoryId6, subCategoryId7: $subCategoryId7, subCategoryId8: $subCategoryId8, subCategoryId9: $subCategoryId9, subCategoryId10: $subCategoryId10, subCategoryId11: $subCategoryId11, subCategoryId12: $subCategoryId12, subCategoryId13: $subCategoryId13, subCategoryId14: $subCategoryId14, subCategoryId15: $subCategoryId15, subCategoryId16: $subCategoryId16)';
  }

  @override
  bool operator ==(covariant HomeResponseModel other) {
    if (identical(this, other)) return true;

    return other.subCategoryId1 == subCategoryId1 &&
        other.subCategoryId2 == subCategoryId2 &&
        other.subCategoryId3 == subCategoryId3 &&
        other.subCategoryId4 == subCategoryId4 &&
        other.subCategoryId5 == subCategoryId5 &&
        other.subCategoryId6 == subCategoryId6 &&
        other.subCategoryId7 == subCategoryId7 &&
        other.subCategoryId8 == subCategoryId8 &&
        other.subCategoryId9 == subCategoryId9 &&
        other.subCategoryId10 == subCategoryId10 &&
        other.subCategoryId11 == subCategoryId11 &&
        other.subCategoryId12 == subCategoryId12 &&
        other.subCategoryId13 == subCategoryId13 &&
        other.subCategoryId14 == subCategoryId14 &&
        other.subCategoryId15 == subCategoryId15 &&
        other.subCategoryId16 == subCategoryId16;
  }

  @override
  int get hashCode {
    return subCategoryId1.hashCode ^
        subCategoryId2.hashCode ^
        subCategoryId3.hashCode ^
        subCategoryId4.hashCode ^
        subCategoryId5.hashCode ^
        subCategoryId6.hashCode ^
        subCategoryId7.hashCode ^
        subCategoryId8.hashCode ^
        subCategoryId9.hashCode ^
        subCategoryId10.hashCode ^
        subCategoryId11.hashCode ^
        subCategoryId12.hashCode ^
        subCategoryId13.hashCode ^
        subCategoryId14.hashCode ^
        subCategoryId15.hashCode ^
        subCategoryId16.hashCode;
  }
}
