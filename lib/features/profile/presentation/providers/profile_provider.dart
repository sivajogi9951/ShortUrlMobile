import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_url/core/providers/common_providers.dart';
import 'package:short_url/features/profile/data/model/profile_model.dart';
import 'package:short_url/features/profile/data/repo_impl/profile_repo_impl.dart';
import 'package:short_url/features/profile/data/source/profile_remote_datasource.dart';
import 'package:short_url/features/profile/domain/repo/profile_repo.dart';
import 'package:short_url/features/profile/domain/usecases/user_details_use_case.dart';

//Repository
final profileRepositoryProvider = Provider<ProfileRepo>((ref) {
  final remote = ProfileRemoteDataSourceImpl(dio: ref.watch(dioProvider));
  final netInfo = ref.watch(connectivityProvider);
  return ProfileRepoImpl(remoteDataSource: remote, networkInfo: netInfo);
});

//UseCases
final getUserDetailsUseCaseProvider = Provider<UserDetailsUseCase>((ref) {
  return UserDetailsUseCase(profileRepo: ref.watch(profileRepositoryProvider));
});

//Provider
final userDetailsProvider = FutureProvider<ProfileModel>((ref) async {
  final result = await ref.watch(getUserDetailsUseCaseProvider).call();
  return result.fold(
        (failure) => throw Exception(failure.message),
        (user) => user,
  );
});