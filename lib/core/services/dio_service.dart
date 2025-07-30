import 'package:dio/dio.dart';
import 'package:short_url/core/constants/app_urls.dart';

class DioService {
  static final DioService _instance = DioService._internal();

  factory DioService() => _instance;

  late final Dio dio;

  DioService._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppUrls.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  // Optional: set token dynamically
  void setAuthToken(String token) {
    dio.options.headers["Authorization"] = "Bearer $token";
  }

  void clearAuthToken() {
    dio.options.headers.remove("Authorization");
  }
}
