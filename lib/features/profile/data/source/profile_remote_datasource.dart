import 'package:dio/dio.dart';
import 'package:short_url/core/constants/app_urls.dart';
import 'package:short_url/core/services/base_service.dart';
import 'package:short_url/core/utils/app_enums.dart';
import 'package:short_url/features/profile/data/model/profile_model.dart';

abstract class ProfileRemoteDataSource{
  Future<ProfileModel> getProfileDetails();
}

class ProfileRemoteDataSourceImpl extends BaseService implements ProfileRemoteDataSource{

  ProfileRemoteDataSourceImpl();

  @override
  Future<ProfileModel> getProfileDetails() async{
    try {
      final response = await makeRequest(baseUrl: AppUrls.baseUrl,url: AppUrls.profileDetails,method: RequestType.get);

      if (response.statusCode == 200) {
        final data = response.data['details'];
        return ProfileModel.fromJson(data);
      } else {
        throw Exception(response.data['details']['detail']);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message);
    }
  }

}