import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/plans/domain/entity/plan_entity.dart';
import 'package:short_url/features/plans/domain/repo/plans_repo.dart';

class GetPlansUseCase {
  final PlansRepository repository;
  GetPlansUseCase(this.repository);

  Future<Either<Failure, List<PlanEntity>>> call() {
    return repository.getPlans();
  }
}