import 'package:beauty_skin/data/api/api_client.dart';
import 'package:dio/dio.dart';

class ProductApi {
  static Future<Response> getAll() {
    return ApiClient().dio.get("/api/products");
  }
}
