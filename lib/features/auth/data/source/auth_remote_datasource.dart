import 'package:dio/dio.dart';
import 'package:short_url/core/constants/app_urls.dart';
import 'package:short_url/features/auth/data/model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String email});
  Future<String> sendOtp({required String email});
  Future<UserModel> verifyOtp({required String email, required String otp});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> login({required String email}) async {
    try {
      final response = await dio.post(AppUrls.login, data: {'email': email});

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['details']['message']);
      } else {
        throw Exception(response.data['details']['detail']);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message);
    }
  }

  @override
  Future<String> sendOtp({required String email}) async {
    try {
      final response = await dio.post(AppUrls.requestOtp, data: {'email': email});

      if (response.statusCode == 200) {
        return response.data['details']['message'];
      } else {
        throw Exception(response.data['details']['detail']);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message);
    }
  }

  @override
  Future<UserModel> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await dio.post(
        AppUrls.verifyCode,
        data: {'email': email, 'code': otp},
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['details']);
      } else {
        throw Exception(response.data['details']['detail']);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message);
    }
  }
}
