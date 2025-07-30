import 'package:dio/dio.dart';
import 'package:short_url/core/constants/app_urls.dart';
import 'package:short_url/features/shorten_url/data/model/short_url_model.dart';
import 'package:short_url/features/shorten_url/data/model/short_url_request.dart';

abstract class ShortUrlRemoteDataSource {
  Future<ShortUrlModel> getShortUrl({required ShortUrlRequest data});
}

class ShortUrlRemoteDataSourceImpl implements ShortUrlRemoteDataSource {
  final Dio dio;

  ShortUrlRemoteDataSourceImpl({required this.dio});

  @override
  Future<ShortUrlModel> getShortUrl({required ShortUrlRequest data}) async {
    try {
      print('RK==>');
      print(data.toJson());
      final response = await dio.post(AppUrls.shorten, data: data.toJson());

      if (response.statusCode == 200) {
        final data = response.data['details'];
        return ShortUrlModel.fromJson(data);
      } else {
        print('RK');
        throw Exception(response.data['details']['detail']);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message);
    }
  }
}
