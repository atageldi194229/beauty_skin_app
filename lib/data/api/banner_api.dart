import 'package:beauty_skin/data/api/api_client.dart';

class BannerApi {
  static ApiLoader getAll() => ApiLoader(
        path: "/banners",
        load: (path) => ApiClient().dio.get(path),
      );
}
