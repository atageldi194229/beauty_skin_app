import 'package:beauty_skin/data/api/api_client.dart';
import 'package:dio/dio.dart';

class CategoryApi {
  static Future<Response> getAll() {
    return ApiClient().dio.get("/api/categories");
  }
}
