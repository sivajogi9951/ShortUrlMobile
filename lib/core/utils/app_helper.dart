import 'package:dio/dio.dart';
import 'package:short_url/core/error/exceptions.dart';

class AppHelper{
  static handleDioException(DioException e) {
    // print('RK => ${e.type}');
    // print('RK => ${e.response}');
    final timeoutTypes = {
      DioExceptionType.connectionTimeout,
      DioExceptionType.receiveTimeout,
      DioExceptionType.badCertificate,
      DioExceptionType.unknown,
    };

    if (timeoutTypes.contains(e.type)) {
      throw NetworkException('Check your internet connection.');
    }else if(e.type==DioExceptionType.connectionError){
      throw ServerException('Unable to reach server, check your connection');
    }

    if (e.response != null) {
      final message = e.response!.data["details"]["detail"][0] ?? e.message;
      throw ServerException(message);
    }

    throw ServerException(e.message ?? 'Unknown Dio error');
  }
}