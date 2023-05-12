import 'package:beauty_skin/data/api/category_api.dart';
import 'package:beauty_skin/data/models/category_model.dart';

class CategoryRepository {
  // Get all Categorys 2
  Future<List<CategoryModel>> fetchCategories2() async {
    final apiLoader = CategoryApi.getAll2();

    final response = await apiLoader.load();

    return (response.data["rows"] as Iterable)
        .map<CategoryModel>((e) => CategoryModel.fromMap(e))
        .toList();
  }

  ///Singleton factory
  static final CategoryRepository _instance = CategoryRepository._internal();
  factory CategoryRepository() => _instance;
  CategoryRepository._internal();
}
