import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/plans/domain/entity/plan_entity.dart';

abstract class PlansRepository {
  Future<Either<Failure,List<PlanEntity>>> getPlans();
}
