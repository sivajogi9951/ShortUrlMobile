import 'package:dio/dio.dart';
import 'package:short_url/core/constants/app_urls.dart';
import 'package:short_url/features/plans/data/model/plan_model.dart';

abstract class PlansRemoteDataSource{
  Future<List<PlanModel>> getPlans();
}

class PlansRemoteDataSourceImpl implements PlansRemoteDataSource{
  final Dio dio;

  PlansRemoteDataSourceImpl({required this.dio});
  @override
  Future<List<PlanModel>> getPlans() async{
    try {
      final response = await dio.get(AppUrls.getPlans);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['details']['plans'];
        return data.map((json) => PlanModel.fromJson(json)).toList();
      } else {
        throw Exception(response.data['details']['detail']);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message);
    }
  }

}