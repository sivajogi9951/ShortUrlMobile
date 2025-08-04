import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/core/error/exceptions.dart';
import 'package:short_url/features/plans/data/model/plan_model.dart';
import 'package:short_url/features/plans/data/source/plans_remote_datasource.dart';
import 'package:short_url/features/plans/domain/repo/plans_repo.dart';

class PlansRepoImpl implements PlansRepository {
  final PlansRemoteDataSource remoteDataSource;
  PlansRepoImpl({required this.remoteDataSource,});

  @override
  Future<Either<Failure, List<PlanModel>>> getPlans() async {
    try {
      final List<PlanModel> plans = await remoteDataSource.getPlans();
      return Right(plans);
    } on NetworkException catch (e) {
      return left(ConnectionFailure(message:e.message));
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    }  catch (e) {
      return left(UnknownFailure(message: 'Unknown : ${e.toString()}'));
    }
  }
}
