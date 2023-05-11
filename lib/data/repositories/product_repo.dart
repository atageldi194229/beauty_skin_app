import 'package:beauty_skin/data/api/product_api.dart';
import 'package:beauty_skin/data/models/product/product_model2.dart';

class ProductRepository {
  // Get all Products 2
  Future<List<ProductModel2>> fetchProducts2() async {
    final apiLoader = ProductApi.getAll2();

    final response = await apiLoader.load();

    return (response.data["rows"]["products"] as Iterable)
        .map<ProductModel2>((e) => ProductModel2.fromMap(e))
        .toList();
  }

  Future<List<ProductModel2>> fetchProducts2Fake() async {
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        ProductModel2(id: 1, price: "10", productName: "aaaaa"),
        ProductModel2(id: 2, price: "30", productName: "abb1n"),
      ],
    );
  }

  ///Singleton factory
  static final ProductRepository _instance = ProductRepository._internal();
  factory ProductRepository() => _instance;
  ProductRepository._internal();
}
