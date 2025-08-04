import 'package:dio/dio.dart';
import 'package:short_url/core/constants/app_urls.dart';
import 'package:short_url/core/error/exceptions.dart';
import 'package:short_url/core/models/base_response.dart';
import 'package:short_url/core/services/base_service.dart';
import 'package:short_url/core/services/connectivity_service.dart';
import 'package:short_url/core/utils/app_enums.dart';
import 'package:short_url/core/utils/app_helper.dart';
import 'package:short_url/features/plans/data/model/plan_model.dart';

abstract class PlansRemoteDataSource{
  Future<List<PlanModel>> getPlans();
}

class PlansRemoteDataSourceImpl extends BaseService implements PlansRemoteDataSource{
  final ConnectivityService connectivityService;

  PlansRemoteDataSourceImpl({required this.connectivityService});
  @override
  Future<List<PlanModel>> getPlans() async{
    final hasConnection = await connectivityService.isConnected();
    if (!hasConnection) {
      throw NetworkException();
    }
    try {

      final response = await makeRequest(baseUrl: AppUrls.baseUrl,url: AppUrls.getPlans,method: RequestType.get);

      if (response.statusCode == 200) {
        final baseResponse = BaseResponse.fromJson(
          response.data,
              (json) => (json as List<dynamic>)
                  .map((item) => PlanModel.fromJson(item as Map<String, dynamic>))
                  .toList(),
        );
        return baseResponse.data!;
      } else {
        throw ServerException('GettingPlans Failed ${response.statusMessage}');
      }
    }  on DioException catch (e) {
      return AppHelper.handleDioException(e);
    } catch (e) {
      throw ServerException('Unexpected error: $e');
    }
  }

}