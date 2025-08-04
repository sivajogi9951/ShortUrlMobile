import 'package:dio/dio.dart';
import 'package:short_url/core/constants/app_urls.dart';
import 'package:short_url/core/error/exceptions.dart';
import 'package:short_url/core/models/base_response.dart';
import 'package:short_url/core/services/base_service.dart';
import 'package:short_url/core/services/connectivity_service.dart';
import 'package:short_url/core/utils/app_enums.dart';
import 'package:short_url/core/utils/app_helper.dart';
import 'package:short_url/features/device_info/data/model/device_info_model.dart';

abstract class DeviceInfoRemoteDataSource {
  Future<DeviceInfoModel> getDeviceDetails();
}

class DeviceInfoRemoteDataSourceImpl extends BaseService
    implements DeviceInfoRemoteDataSource {
  final ConnectivityService connectivityService;

  DeviceInfoRemoteDataSourceImpl({required this.connectivityService});
  @override
  Future<DeviceInfoModel> getDeviceDetails() async {
    try {
      final hasConnection = await connectivityService.isConnected();
      if (!hasConnection) {
        throw NetworkException();
      }
      final response = await makeRequest(
        baseUrl: AppUrls.baseUrl,
        url: AppUrls.deviceInfo,
        method: RequestType.get,
      );

      if (response.statusCode == 200) {
        final baseResponse = BaseResponse.fromJson(
          response.data,
          (json) => DeviceInfoModel.fromJson(json as Map<String, dynamic>),
        );
        return baseResponse.data!;
      } else {
        throw ServerException('DeviceInfo Failed ${response.statusMessage}');
      }
    } on DioException catch (e) {
      return AppHelper.handleDioException(e);
    } catch (e) {
      throw ServerException('Unexpected error: $e');
    }
  }
}
