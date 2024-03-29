part of 'product_api.dart';

class ProductQueryParameters {
  final int page;
  final String? search;
  final int? categoryId;
  final int? subCategoryId;
  final int? brandId;

  ProductQueryParameters({
    required this.page,
    this.search,
    this.categoryId,
    this.subCategoryId,
    this.brandId,
  });

  ProductQueryParameters copyWith({
    int? page,
    String? search,
    int? categoryId,
    int? subCategoryId,
    int? brandId,
  }) {
    return ProductQueryParameters(
      page: page ?? this.page,
      search: search ?? this.search,
      categoryId: categoryId ?? this.categoryId,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      brandId: brandId ?? this.brandId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      if (search?.isNotEmpty == true) 'search': search,
      if (categoryId != null) 'category': categoryId,
      if (subCategoryId != null) 'subcategory': subCategoryId,
      if (brandId != null) 'brand': brandId,
    };
  }

  factory ProductQueryParameters.fromMap(Map<String, dynamic> map) {
    return ProductQueryParameters(
      page: map['page'] as int,
      search: map['search'] != null ? map['search'] as String : null,
      categoryId: map['category'] != null ? map['category'] as int : null,
      subCategoryId:
          map['subcategory'] != null ? map['subcategory'] as int : null,
      brandId: map['brand'] != null ? map['brand'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductQueryParameters.fromJson(String source) =>
      ProductQueryParameters.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductQueryParameters(page: $page, search: $search, category: $categoryId, subcategory: $subCategoryId, brand: $brandId)';
  }

  @override
  bool operator ==(covariant ProductQueryParameters other) {
    if (identical(this, other)) return true;

    return other.page == page &&
        other.search == search &&
        other.categoryId == categoryId &&
        other.subCategoryId == subCategoryId &&
        other.brandId == brandId;
  }

  @override
  int get hashCode {
    return page.hashCode ^
        search.hashCode ^
        categoryId.hashCode ^
        subCategoryId.hashCode ^
        brandId.hashCode;
  }
}
