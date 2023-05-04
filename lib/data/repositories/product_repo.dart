import 'package:beauty_skin/data/api/product_api.dart';
import 'package:beauty_skin/data/models/product_model2.dart';

class ProductRepository {
  // Get all Products 2
  Future<List<ProductModel2>> fetchCategories2() async {
    final apiLoader = ProductApi.getAll2();

    final response = await apiLoader.load();

    return (response.data["rows"]["products"] as Iterable)
        .map<ProductModel2>((e) => ProductModel2.fromMap(e))
        .toList();
  }

  ///Singleton factory
  static final ProductRepository _instance = ProductRepository._internal();
  factory ProductRepository() => _instance;
  ProductRepository._internal();
}
