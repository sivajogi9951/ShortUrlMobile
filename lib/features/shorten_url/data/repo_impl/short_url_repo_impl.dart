import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/core/services/connectivity_service.dart';
import 'package:short_url/features/shorten_url/data/model/short_url_model.dart';
import 'package:short_url/features/shorten_url/data/model/short_url_request.dart';
import 'package:short_url/features/shorten_url/data/source/short_url_remote_datasource.dart';
import 'package:short_url/features/shorten_url/domain/repo/short_url_repo.dart';

class ShortUrlRepoImpl implements ShortUrlRepo {
  final ShortUrlRemoteDataSource remoteDataSource;
  final ConnectivityService networkInfo;

  ShortUrlRepoImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, ShortUrlModel>> getShortUrl({
    required ShortUrlRequest request,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(ConnectionFailure(message: 'Check Internet Connectivity'));
    }
    try {
      final ShortUrlModel shortUrl = await remoteDataSource.getShortUrl(
        data: request,
      );
      return Right(shortUrl);
    } catch (e) {

      return Left(ServerFailure(message: e.toString()));
    }
  }
}
