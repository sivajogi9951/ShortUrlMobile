//Repository
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/core/providers/common_providers.dart';
import 'package:short_url/features/qr_code/data/repo_impl/qr_code_repo_impl.dart';
import 'package:short_url/features/qr_code/data/source/qr_code_remote_datasource.dart';
import 'package:short_url/features/qr_code/domain/entity/qr_code.dart';
import 'package:short_url/features/qr_code/domain/repo/qr_code_repo.dart';
import 'package:short_url/features/qr_code/domain/usecases/create_qr_code.dart';

//Repository
final qrRepositoryProvider = Provider<QrCodeRepo>((ref) {
  final remote = QrCodeRemoteDataSourceImpl(
    connectivityService: ref.watch(connectivityProvider),
  );
  return QrCodeRepoImpl(remoteDataSource: remote);
});

//UseCases
final createQrCodeUseCaseProvider = Provider<CreateQrCodeUserCase>((ref) {
  return CreateQrCodeUserCase(repo: ref.watch(qrRepositoryProvider));
});

final qrCodeProvider = AsyncNotifierProvider<QrCodeNotifier, QrCodeEntity?>(
  () => QrCodeNotifier(),
);

class QrCodeNotifier extends AsyncNotifier<QrCodeEntity?> {
  @override
  Future<QrCodeEntity?> build() async => null;

  Future<Either<Failure, QrCodeEntity>> generateQrCode({
    required String url,
  }) async {
    final useCase = ref.read(createQrCodeUseCaseProvider);
    return await useCase(url: url);
  }
}
