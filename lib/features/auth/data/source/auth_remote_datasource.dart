import 'package:dio/dio.dart';
import 'package:short_url/core/constants/app_urls.dart';
import 'package:short_url/core/services/base_service.dart';
import 'package:short_url/core/utils/app_enums.dart';
import 'package:short_url/features/auth/data/model/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> requestOtp({required String email});
  Future<AuthModel> verifyOtp({required String email, required String otp});
}

class AuthRemoteDataSourceImpl extends BaseService
    implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl();

  @override
  Future<AuthModel> requestOtp({required String email}) async {
    try {

      final response = await makeRequest(baseUrl: AppUrls.baseUrl,url: AppUrls.requestOtp,method: RequestType.post,body: {
        "email":email
      });

      if (response.statusCode == 200) {
        return AuthModel.fromJson(response.data['data']);
      } else {
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message);
    }
  }

  @override
  Future<AuthModel> verifyOtp({required String email,required String otp}) async {
    try {
      final response = await makeRequest(baseUrl: AppUrls.baseUrl,url: AppUrls.login,method: RequestType.post,body: {
        "email":email,
        "code":otp
      });
      if (response.statusCode == 200) {
        return AuthModel.fromJson(response.data['data']);
      } else {
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message);
    }
  }
}
