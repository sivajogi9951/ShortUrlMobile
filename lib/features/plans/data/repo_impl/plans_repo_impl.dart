import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/core/services/connectivity_service.dart';
import 'package:short_url/features/plans/data/model/plan_model.dart';
import 'package:short_url/features/plans/data/source/plans_remote_datasource.dart';
import 'package:short_url/features/plans/domain/repo/plans_repo.dart';

class PlansRepoImpl implements PlansRepository {
  final PlansRemoteDataSource remoteDataSource;
  final ConnectivityService networkInfo;

  PlansRepoImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<PlanModel>>> getPlans() async {
    if (!await networkInfo.isConnected) {
      return Left(ConnectionFailure(message: 'Check Internet Connectivity'));
    }
    try {
      final List<PlanModel> plans = await remoteDataSource.getPlans();
      return Right(plans);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
