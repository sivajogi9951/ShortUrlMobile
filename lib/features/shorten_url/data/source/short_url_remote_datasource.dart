import 'package:dio/dio.dart';
import 'package:short_url/core/constants/app_urls.dart';
import 'package:short_url/core/error/exceptions.dart';
import 'package:short_url/core/models/base_response.dart';
import 'package:short_url/core/services/base_service.dart';
import 'package:short_url/core/services/connectivity_service.dart';
import 'package:short_url/core/utils/app_enums.dart';
import 'package:short_url/core/utils/app_helper.dart';
import 'package:short_url/features/shorten_url/data/model/short_url_model.dart';
import 'package:short_url/features/shorten_url/data/model/short_url_request.dart';

abstract class ShortUrlRemoteDataSource {
  Future<ShortUrlModel> getShortUrl({required String url,required String deviceId});
}

class ShortUrlRemoteDataSourceImpl extends BaseService
    implements ShortUrlRemoteDataSource {
  final ConnectivityService connectivityService;

  ShortUrlRemoteDataSourceImpl({required this.connectivityService});

  @override
  Future<ShortUrlModel> getShortUrl({required String url,required String deviceId}) async {
    try {
      final hasConnection = await connectivityService.isConnected();
      if (!hasConnection) {
        throw NetworkException();
      }

      final response = await makeRequest(
        baseUrl: AppUrls.baseUrl,
        url: AppUrls.shortUrl,
        method: RequestType.post,
        body: {
          "main_url": url,
          "device_id": deviceId,
          "custom_domain": ""
        },
      );

      if (response.statusCode == 200) {
        // final BaseResponse data = BaseResponse.fromJson(
        //   response.data['data'],
        //   (json) => ShortUrlModel.fromJson(json as Map<String, dynamic>),
        // );
        return ShortUrlModel.fromJson(response.data['data']);
      } else {
        throw Exception(response.data['data']['detail']);
      }
    } on DioException catch (e) {
      return AppHelper.handleDioException(e);
    } catch (e) {
      print(e.toString());
      throw ServerException('Unexpected error: $e');
    }
  }
}
