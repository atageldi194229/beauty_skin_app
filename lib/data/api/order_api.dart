import 'package:beauty_skin/data/api/api_client.dart';
import 'package:dio/dio.dart';

class OrderApi {
  static Future<Response> create(Map<String, dynamic> data) {
    return ApiClient().dio.post(
          "/api/ordering",
          data: FormData.fromMap(data),
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
          ),
        );
  }

  static Future<Response> getOne(int orderId) {
    return ApiClient().dio.get("/api/orders/$orderId");
  }
}
