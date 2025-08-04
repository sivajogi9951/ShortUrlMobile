import 'package:dio/dio.dart';
import 'package:short_url/core/constants/app_urls.dart';
import 'package:short_url/core/error/exceptions.dart';
import 'package:short_url/core/models/base_response.dart';
import 'package:short_url/core/services/base_service.dart';
import 'package:short_url/core/services/connectivity_service.dart';
import 'package:short_url/core/utils/app_enums.dart';
import 'package:short_url/core/utils/app_helper.dart';
import 'package:short_url/features/qr_code/data/model/qr_code_model.dart';

abstract class QrCodeRemoteDataSource {
  Future<List<QrCodeModel>> getGeneratedQrCodes();
  Future<QrCodeModel> generateQrCode({required String url});
}

class QrCodeRemoteDataSourceImpl extends BaseService
    implements QrCodeRemoteDataSource {
  final ConnectivityService connectivityService;

  QrCodeRemoteDataSourceImpl({required this.connectivityService});
  @override
  Future<QrCodeModel> generateQrCode({required String url}) async {
    try {
      final hasConnection = await connectivityService.isConnected();
      if (!hasConnection) {
        throw NetworkException();
      }
      final response = await makeRequest(
        baseUrl: AppUrls.baseUrl,
        url: AppUrls.generateQrCode,
        method: RequestType.post,
      );

      if (response.statusCode == 200) {
        final baseResponse = BaseResponse.fromJson(
          response.data,
          (json) => QrCodeModel.fromJson(json as Map<String, dynamic>),
        );
        return baseResponse.data!;
      } else {
        throw ServerException('Qr Failed ${response.statusMessage}');
      }
    } on DioException catch (e) {
      return AppHelper.handleDioException(e);
    } catch (e) {
      throw ServerException('Unexpected error: $e');
    }
  }

  @override
  Future<List<QrCodeModel>> getGeneratedQrCodes() async {
    try {
      final hasConnection = await connectivityService.isConnected();
      if (!hasConnection) {
        throw NetworkException();
      }
      final response = await makeRequest(url: AppUrls.generateQrCode);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['details'];
        return data.map((json) => QrCodeModel.fromJson(json)).toList();
      } else {
        throw ServerException('GettingPlans Failed ${response.statusMessage}');
      }
    } on DioException catch (e) {
      return AppHelper.handleDioException(e);
    } catch (e) {
      throw ServerException('Unexpected error: $e');
    }
  }
}
