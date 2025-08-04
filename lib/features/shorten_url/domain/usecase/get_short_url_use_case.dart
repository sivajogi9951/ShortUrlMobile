import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/shorten_url/data/model/short_url_request.dart';
import 'package:short_url/features/shorten_url/domain/entity/short_url.dart';
import 'package:short_url/features/shorten_url/domain/repo/short_url_repo.dart';

class GetShortUrlUseCase {
  final ShortUrlRepo repository;
  GetShortUrlUseCase(this.repository);

  Future<Either<Failure, ShortUrl>> call({
    required String url,
    required String deviceId,
  }) {
    return repository.getShortUrl(url: url, deviceId: deviceId);
  }
}
