import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/shorten_url/data/model/short_url_request.dart';
import 'package:short_url/features/shorten_url/domain/entity/short_url.dart';

abstract class ShortUrlRepo {
  Future<Either<Failure, ShortUrl>> getShortUrl({
    required String url,
    required String deviceId,
  });
}
