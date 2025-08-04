import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/exceptions.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/shorten_url/data/model/short_url_model.dart';
import 'package:short_url/features/shorten_url/data/model/short_url_request.dart';
import 'package:short_url/features/shorten_url/data/source/short_url_remote_datasource.dart';
import 'package:short_url/features/shorten_url/domain/repo/short_url_repo.dart';

class ShortUrlRepoImpl implements ShortUrlRepo {
  final ShortUrlRemoteDataSource remoteDataSource;

  ShortUrlRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ShortUrlModel>> getShortUrl({
    required String url,
    required String deviceId,
  }) async {
    try {
      final ShortUrlModel shortUrl = await remoteDataSource.getShortUrl(
        url: url,deviceId: deviceId
      );
      return Right(shortUrl);
    } on NetworkException catch (e) {
      return Left(ConnectionFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }catch (e) {
      return left(UnknownFailure(message: 'Unknown : ${e.toString()}'));
    }
  }
}
