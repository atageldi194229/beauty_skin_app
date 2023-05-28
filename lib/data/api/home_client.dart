import 'package:beauty_skin/data/api/api_client.dart';
import 'package:dio/dio.dart';

class HomeApi {
  static Future<Response> fetchHomeStructure() {
    return ApiClient().dio.get("/api/phonestruct");
  }
}
