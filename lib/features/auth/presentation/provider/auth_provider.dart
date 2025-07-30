import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/core/providers/common_providers.dart';
import 'package:short_url/core/services/shared_prefs.dart';
import 'package:short_url/features/auth/data/model/user_model.dart';
import 'package:short_url/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:short_url/features/auth/data/source/auth_remote_datasource.dart';
import 'package:short_url/features/auth/domain/repo/auth_repo.dart';
import 'package:short_url/features/auth/domain/usecases/request_otp_use_case.dart';
import 'package:short_url/features/auth/domain/usecases/verify_otp_use_case.dart';

//Repository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remote = AuthRemoteDataSourceImpl(dio: ref.watch(dioProvider));
  final netInfo = ref.watch(connectivityProvider);
  return AuthRepoImpl(remoteDataSource: remote, networkInfo: netInfo);
});

//Providers
final authProvider = AsyncNotifierProvider<AuthNotifier, UserModel?>(
  () => AuthNotifier(),
);

//UseCases
final requestOtpUseCaseProvider = Provider<RequestOtpUseCase>((ref) {
  return RequestOtpUseCase(ref.watch(authRepositoryProvider));
});

final verifyOtpUseCaseProvider = Provider<VerifyOtpUseCase>((ref) {
  return VerifyOtpUseCase(ref.watch(authRepositoryProvider));
});

class AuthNotifier extends AsyncNotifier<UserModel?> {
  @override
  Future<UserModel?> build() async => null;

  Future<Either<Failure, String>> requestOtp(String email) async {
    final usecase = ref.read(requestOtpUseCaseProvider);
    return await usecase(email);
  }

  Future<void> verifyOtp(String email, String otp) async {
    state = const AsyncValue.loading();
    final usecase = ref.read(verifyOtpUseCaseProvider);
    final result = await usecase(email, otp);

    result.fold(
      (failure) =>
          state = AsyncValue.error(failure.message, StackTrace.current),
      (user) async {
        await SharedPrefs.saveUser(user);
        state = AsyncValue.data(user);
      },
    );
  }
}
