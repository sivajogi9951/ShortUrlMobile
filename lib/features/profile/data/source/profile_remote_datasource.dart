import 'package:dio/dio.dart';
import 'package:short_url/core/constants/app_urls.dart';
import 'package:short_url/features/profile/data/model/profile_model.dart';

abstract class ProfileRemoteDataSource{
  Future<ProfileModel> getProfileDetails();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource{
  final Dio dio;

  ProfileRemoteDataSourceImpl({required this.dio});

  @override
  Future<ProfileModel> getProfileDetails() async{
    try {
      final response = await dio.get(AppUrls.profileDetails);

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