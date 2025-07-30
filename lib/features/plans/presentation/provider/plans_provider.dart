import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_url/core/providers/common_providers.dart';
import 'package:short_url/features/plans/data/model/plan_model.dart';
import 'package:short_url/features/plans/data/repo_impl/plans_repo_impl.dart';
import 'package:short_url/features/plans/data/source/plans_remote_datasource.dart';
import 'package:short_url/features/plans/domain/repo/plans_repo.dart';
import 'package:short_url/features/plans/domain/usecases/get_plans_use_case.dart';

//Repository
final plansRepositoryProvider = Provider<PlansRepository>((ref) {
  final remote = PlansRemoteDataSourceImpl(dio: ref.watch(dioProvider));
  final netInfo = ref.watch(connectivityProvider);
  return PlansRepoImpl(remoteDataSource: remote, networkInfo: netInfo);
});

//UseCases
final getPlansUseCaseProvider = Provider<GetPlansUseCase>((ref) {
  return GetPlansUseCase(ref.watch(plansRepositoryProvider));
});


//Provider
final plansProvider = FutureProvider<List<PlanModel>>((ref) async {
  final result = await ref.watch(getPlansUseCaseProvider).call();
  return result.fold(
        (failure) => throw Exception(failure.message),
        (plans) => plans,
  );
});