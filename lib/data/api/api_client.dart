import 'package:beauty_skin/constants/constants.dart';
import 'package:dio/dio.dart';

final localhostOptions = BaseOptions(
  baseUrl: kBaseUrl,
  // connectTimeout: 5000,
  // receiveTimeout: 3000,
  // sendTimeout: 3000,
);

class ApiClient {
  late final Dio dio;
  ApiClient._sharedInstance() : dio = Dio(localhostOptions);
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
