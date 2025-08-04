import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:short_url/core/constants/app_urls.dart';
import 'package:short_url/core/utils/app_enums.dart';

class BaseService {
  Dio dio = Dio();

  BaseService() {
    _initializeInterceptors();
  }

  void _initializeInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        log('RequestOptions[${options.data}]');
        return handler.next(options); // Continue with the request
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        log('Response[${response.statusCode}] => PATH: ${response.requestOptions.uri}');
        return handler.next(response); // Continue with the response
      },
      onError: (DioException e, ErrorInterceptorHandler handler) {
        // Log the error details
        log('hello siva ${e.toString()}');
        log('hello siva111 ${handler.toString()}');
        log('Error[${e.response?.statusCode}] => PATH: ${e.requestOptions.uri}');
        log('Message: ${e.message}');
        return handler.next(e); // Pass the error onward
      },
    ));
  }

  Future<dynamic> makeRequest<T>({
    required String url,
    String? baseUrl,
    String? token1,
    dynamic body,
    Options? options,
    String? contentType,
    Map<String, dynamic>? queryParameters,
    RequestType method = RequestType.get,
    CancelToken? token,
    Map<String, dynamic>? headers,
  }) async {
    dio.options.baseUrl = baseUrl ?? AppUrls.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 60);
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.contentType = contentType ?? 'application/json';
    dio.options.headers = {
      "Authorization": token1 != null ? "Bearer $token1" : "",
      ...?headers,
    };

    Response response;

    try {
      switch (method) {
        case RequestType.get:
          final uri = Uri.parse(dio.options.baseUrl + url)
              .replace(queryParameters: queryParameters);
          response = await dio.getUri(uri, cancelToken: token);
          break;
        case RequestType.put:
          response = await dio.put(url,
              options: options, data: json.encode(body));
          break;
        case RequestType.post:
          response = await dio.post(
            url,
            options: options,
            queryParameters: queryParameters,
            data: body is FormData ? body : json.encode(body),
          );
          break;
        case RequestType.delete:
          response = await dio.delete(url,
              options: options,
              queryParameters: queryParameters,
              data: json.encode(body));
          break;
      }
      return response;
    } on DioException catch (e) {
      log('Request failed: ${e.response?.statusCode} - ${e.message}');
      return e.response!;
    } catch (e,st) {
      log('Unexpected error: $e');
      log('Unexpected error: $st');
      return e;
    }
  }
}