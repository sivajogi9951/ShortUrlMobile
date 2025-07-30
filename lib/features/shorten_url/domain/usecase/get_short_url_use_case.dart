import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/shorten_url/data/model/short_url_model.dart';
import 'package:short_url/features/shorten_url/data/model/short_url_request.dart';
import 'package:short_url/features/shorten_url/domain/repo/short_url_repo.dart';

class GetShortUrlUseCase{
  final ShortUrlRepo repository;
  GetShortUrlUseCase(this.repository);

  Future<Either<Failure, ShortUrlModel>> call({required ShortUrlRequest request}) {
    return repository.getShortUrl(request: request);
  }
}