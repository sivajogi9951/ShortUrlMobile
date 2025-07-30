import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/plans/data/model/plan_model.dart';

abstract class PlansRepository {
  Future<Either<Failure,List<PlanModel>>> getPlans();
}
