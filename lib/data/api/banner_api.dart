import 'package:beauty_skin/data/api/api_client.dart';

class BannerApi {
  static ApiLoader getAll() => ApiLoader(
        path: "/banners",
        load: (path) => ApiClient().dio.get(path),
      );

  static ApiLoader getAll2() => ApiLoader(
        path: "/api/en/get-banners/1",
        load: (path) => ApiClient().dio.get(path),
      );
}
