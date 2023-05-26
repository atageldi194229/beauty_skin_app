part of 'product_api.dart';

class ProductQueryParameters {
  final int page;
  final String? search;
  final int? categoryId;
  final int? subCategoryId;

  ProductQueryParameters({
    required this.page,
    required this.search,
    this.categoryId,
    this.subCategoryId,
  });

  ProductQueryParameters copyWith({
    int? page,
    String? search,
    int? categoryId,
    int? subCategoryId,
  }) {
    return ProductQueryParameters(
      page: page ?? this.page,
      search: search ?? this.search,
      categoryId: categoryId ?? this.categoryId,
      subCategoryId: subCategoryId ?? this.subCategoryId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      if (search != null) 'search': search,
      if (categoryId != null) 'categoryId': categoryId,
      if (subCategoryId != null) 'subCategoryId': subCategoryId,
    };
  }

  factory ProductQueryParameters.fromMap(Map<String, dynamic> map) {
    return ProductQueryParameters(
      page: map['page'] as int,
      search: map['search'] != null ? map['search'] as String : null,
      categoryId: map['categoryId'] != null ? map['categoryId'] as int : null,
      subCategoryId:
          map['subCategoryId'] != null ? map['subCategoryId'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductQueryParameters.fromJson(String source) =>
      ProductQueryParameters.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductQueryParameters(page: $page, search: $search, categoryId: $categoryId, subCategoryId: $subCategoryId)';
  }

  @override
  bool operator ==(covariant ProductQueryParameters other) {
    if (identical(this, other)) return true;

    return other.page == page &&
        other.search == search &&
        other.categoryId == categoryId &&
        other.subCategoryId == subCategoryId;
  }

  @override
  int get hashCode {
    return page.hashCode ^
        search.hashCode ^
        categoryId.hashCode ^
        subCategoryId.hashCode;
  }
}
