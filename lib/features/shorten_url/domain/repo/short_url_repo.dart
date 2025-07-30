import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/shorten_url/data/model/short_url_model.dart';
import 'package:short_url/features/shorten_url/data/model/short_url_request.dart';

abstract class ShortUrlRepo {
  Future<Either<Failure, ShortUrlModel>> getShortUrl({
    required ShortUrlRequest request,
  });
}
