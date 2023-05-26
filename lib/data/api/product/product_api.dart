// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:beauty_skin/data/api/api_client.dart';

part 'query.dart';

class ProductApi {
  static Future<Response> getAll([ProductQueryParameters? queryParameters]) {
    return ApiClient().dio.get(
          "/api/products",
          queryParameters: queryParameters?.toMap(),
        );
  }
}
