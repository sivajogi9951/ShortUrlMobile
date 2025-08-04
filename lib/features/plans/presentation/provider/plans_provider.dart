import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_url/core/error/exceptions.dart';
import 'package:short_url/core/providers/common_providers.dart';
import 'package:short_url/features/plans/data/repo_impl/plans_repo_impl.dart';
import 'package:short_url/features/plans/data/source/plans_remote_datasource.dart';
import 'package:short_url/features/plans/domain/entity/plan_entity.dart';
import 'package:short_url/features/plans/domain/repo/plans_repo.dart';
import 'package:short_url/features/plans/domain/usecases/get_plans_use_case.dart';

//Repository
final plansRepositoryProvider = Provider<PlansRepository>((ref) {
  final connectivity = ref.watch(connectivityProvider);

  final remote = PlansRemoteDataSourceImpl(
    connectivityService: connectivity,
  );

  return PlansRepoImpl(remoteDataSource: remote);
});

//UseCases
final getPlansUseCaseProvider = Provider<GetPlansUseCase>((ref) {
  return GetPlansUseCase(ref.watch(plansRepositoryProvider));
});

//Provider
final plansProvider = FutureProvider<List<PlanEntity>>((ref) async {
  final result = await ref.watch(getPlansUseCaseProvider).call();
  return result.fold(
    (failure) => throw ServerException(failure.message),
    (plans) => plans,
  );
});
