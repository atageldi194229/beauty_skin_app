import 'package:beauty_skin/constants/constants.dart';
import 'package:dio/dio.dart';

final dioOptions = BaseOptions(
  baseUrl: kBaseUrl,
  connectTimeout: const Duration(milliseconds: 5000),
  receiveTimeout: const Duration(milliseconds: 5000),
  sendTimeout: const Duration(milliseconds: 5000),
);

class ApiClient {
  late final Dio dio;
  ApiClient._sharedInstance() : dio = Dio(dioOptions);
  // ..interceptors.add(
  //   PrettyDioLogger(
  //     requestHeader: true,
  //     requestBody: true,
  //     responseBody: true,
  //     responseHeader: false,
  //     compact: false,
  //   ),
  // );
  static final ApiClient _shared = ApiClient._sharedInstance();
  factory ApiClient() => _shared;
}

class ApiLoader {
  final String path;
  late Future<Response> Function() load;

  ApiLoader({
    required this.path,
    required Future<Response> Function(String path) load,
  }) {
    this.load = () => load(path);
  }
}
