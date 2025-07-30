//Repository
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/core/providers/common_providers.dart';
import 'package:short_url/features/shorten_url/data/model/short_url_model.dart';
import 'package:short_url/features/shorten_url/data/model/short_url_request.dart';
import 'package:short_url/features/shorten_url/data/repo_impl/short_url_repo_impl.dart';
import 'package:short_url/features/shorten_url/data/source/short_url_remote_datasource.dart';
import 'package:short_url/features/shorten_url/domain/repo/short_url_repo.dart';
import 'package:short_url/features/shorten_url/domain/usecase/get_short_url_use_case.dart';

//Repository
final shortUrlRepositoryProvider = Provider<ShortUrlRepo>((ref) {
  final remote = ShortUrlRemoteDataSourceImpl(dio: ref.watch(dioProvider));
  final netInfo = ref.watch(connectivityProvider);
  return ShortUrlRepoImpl(remoteDataSource: remote, networkInfo: netInfo);
});

//UseCases
final getShortUrlUseCaseProvider = Provider<GetShortUrlUseCase>((ref) {
  return GetShortUrlUseCase(ref.watch(shortUrlRepositoryProvider));
});


final shortUrlProvider = AsyncNotifierProvider<ShortUrlNotifier, ShortUrlModel?>(
      () => ShortUrlNotifier(),
);

class ShortUrlNotifier extends AsyncNotifier<ShortUrlModel?> {
  @override
  Future<ShortUrlModel?> build() async => null;

  Future<Either<Failure, ShortUrlModel>> requestShortUrl({required String mainURL,required String deviceId}) async {
    final useCase = ref.read(getShortUrlUseCaseProvider);
    return await useCase(request: ShortUrlRequest(mainURL: mainURL, userId: null, deviceId: deviceId, customDomain: null));
  }
}