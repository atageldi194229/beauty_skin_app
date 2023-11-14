// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beauty_skin/data/models/brand/brand_model.dart';
import 'package:beauty_skin/data/models/category/category_model.dart';
import 'package:beauty_skin/data/models/category/sub_category_model.dart';
import 'package:equatable/equatable.dart';

class ProductFilter extends Equatable {
  final String? search;
  final CategoryModel? category;
  final SubCategoryModel? subCategory;
  final BrandModel? brand;

  const ProductFilter({
    this.search,
    this.category,
    this.subCategory,
    this.brand,
  });

  @override
  List<Object?> get props => [
        search,
        category,
        subCategory,
        brand,
      ];
}
