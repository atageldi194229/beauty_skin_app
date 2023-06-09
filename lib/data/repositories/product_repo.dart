import 'package:beauty_skin/data/api/product/product_api.dart';
import 'package:beauty_skin/data/models/product/product_model.dart';

class ProductRepository {
  // Get all Products
  Future<List<ProductModel>> fetchProducts([
    ProductQueryParameters? queryParameters,
  ]) async {
    final response = await ProductApi.getAll(queryParameters);

    return (response.data["data"] as Iterable)
        .map<ProductModel>((e) => ProductModel.fromMap(e))
        .toList();
  }

  ///Singleton factory
  static final ProductRepository _instance = ProductRepository._internal();
  factory ProductRepository() => _instance;
  ProductRepository._internal();
}
