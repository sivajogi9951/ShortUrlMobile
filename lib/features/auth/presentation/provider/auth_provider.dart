import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/core/providers/common_providers.dart';
import 'package:short_url/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:short_url/features/auth/data/source/auth_remote_datasource.dart';
import 'package:short_url/features/auth/domain/entity/auth_entity.dart';
import 'package:short_url/features/auth/domain/repo/auth_repo.dart';
import 'package:short_url/features/auth/domain/usecases/request_otp_use_case.dart';
import 'package:short_url/features/auth/domain/usecases/verify_otp_use_case.dart';


// final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
//       (ref) => AuthNotifier(),
// );
// class AuthState {
//   final bool isAuthenticated;
//   AuthState({required this.isAuthenticated});
//   AuthState copyWith({bool? isAuthenticated}) =>
//       AuthState(isAuthenticated: isAuthenticated ?? this.isAuthenticated);
// }
// class AuthNotifier extends StateNotifier<AuthState> {
//   AuthNotifier() : super(AuthState(isAuthenticated: false));
//
//   @override
//   Stream<AuthState> get stream async* {
//     yield* Stream.periodic(const Duration(seconds: 1), (_) => state);
//   }
//
//   void login(String email, String password) {
//     // Simulated login
//     state = AuthState(isAuthenticated: true);
//   }
//
//   void register(String email, String password) {
//     state = AuthState(isAuthenticated: true);
//   }
//
//   void logout() {
//     state = AuthState(isAuthenticated: false);
//   }
// }
//







//Repository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remote = AuthRemoteDataSourceImpl();
  final netInfo = ref.watch(connectivityProvider);
  return AuthRepoImpl(remoteDataSource: remote, networkInfo: netInfo);
});

//Providers
final authProvider = AsyncNotifierProvider<AuthNotifier, AuthEntity?>(
  () => AuthNotifier(),
);

//UseCases
final requestOtpUseCaseProvider = Provider<RequestOtpUseCase>((ref) {
  return RequestOtpUseCase(ref.watch(authRepositoryProvider));
});

final verifyOtpUseCaseProvider = Provider<VerifyOtpUseCase>((ref) {
  return VerifyOtpUseCase(ref.watch(authRepositoryProvider));
});

class AuthNotifier extends AsyncNotifier<AuthEntity?> {
  @override
  Future<AuthEntity?> build() async => null;

  Future<Either<Failure, AuthEntity>> requestOtp(String email) async {
    state = const AsyncValue.loading();
    final useCase = ref.read(requestOtpUseCaseProvider);
    state = const AsyncValue.data(null);
    return await useCase(email);

  }

  Future<void> verifyOtp(String email, String otp) async {
    state = const AsyncValue.loading();
    final useCase = ref.read(verifyOtpUseCaseProvider);
    final result = await useCase(email, otp);

    result.fold(
      (failure){
        print(failure.message);
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (user) async {
        print("Login Success ${user.userId} ${user.apiKey}");
        await ref.read(sharedPrefsProvider).saveApiKey(user.apiKey);
        await ref.read(sharedPrefsProvider).saveUserId(user.userId);
        state = AsyncValue.data(user);
      },
    );
  }
}
