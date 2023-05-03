import 'package:beauty_skin/data/api/api_client.dart';

class CategoryApi {
  static ApiLoader getAll() => ApiLoader(
        path: "/banners",
        load: (path) => ApiClient().dio.get(path),
      );

  static ApiLoader getAll2() => ApiLoader(
        path: "/api/en/get-categories",
        load: (path) => ApiClient().dio.get(path),
      );
}
