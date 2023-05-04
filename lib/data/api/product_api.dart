import 'package:beauty_skin/data/api/api_client.dart';

class ProductApi {
  static ApiLoader getAll() => ApiLoader(
        path: "/products",
        load: (path) => ApiClient().dio.get(path),
      );

  static ApiLoader getAll2() => ApiLoader(
        path: "/api/en/get-products",
        load: (path) => ApiClient().dio.get(path),
      );
}
