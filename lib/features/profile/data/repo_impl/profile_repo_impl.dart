import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/core/services/connectivity_service.dart';
import 'package:short_url/features/profile/data/model/profile_model.dart';
import 'package:short_url/features/profile/data/source/profile_remote_datasource.dart';
import 'package:short_url/features/profile/domain/repo/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource remoteDataSource;
  final ConnectivityService networkInfo;

  ProfileRepoImpl({required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, ProfileModel>> getProfileDetails() async {
    if (!await networkInfo.isConnected) {
      return Left(ConnectionFailure(message: 'Check Internet Connectivity'));
    }

    try {
      final ProfileModel profile = await remoteDataSource.getProfileDetails();
      return Right(profile);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
