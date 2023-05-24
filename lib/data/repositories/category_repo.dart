import 'package:beauty_skin/data/api/category_api.dart';
import 'package:beauty_skin/data/models/category/category_model.dart';
import 'package:beauty_skin/data/models/category/sub_category_model.dart';

class CategoryRepository {
  // Get all Categorys 2
  Future<CategoriesResponse> fetchCategories() async {
    final response = await CategoryApi.getAll();

    final categories =
        (response.data["data"][0]["original"]["Categories"] as Iterable)
            .map<CategoryModel>((e) => CategoryModel.fromMap(e))
            .toList();

    final subCategories =
        (response.data["data"][0]["original"]["Sub_Categories"] as Iterable)
            .map<SubCategoryModel>((e) => SubCategoryModel.fromMap(e))
            .toList();

    return CategoriesResponse(
      categories: categories,
      subCategories: subCategories,
    );
  }

  ///Singleton factory
  static final CategoryRepository _instance = CategoryRepository._internal();
  factory CategoryRepository() => _instance;
  CategoryRepository._internal();
}

class CategoriesResponse {
  final List<CategoryModel> categories;
  final List<SubCategoryModel> subCategories;

  CategoriesResponse({
    required this.categories,
    required this.subCategories,
  });
}
