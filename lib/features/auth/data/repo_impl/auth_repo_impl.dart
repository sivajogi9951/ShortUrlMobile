import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/core/services/connectivity_service.dart';
import 'package:short_url/features/auth/data/model/auth_model.dart';
import 'package:short_url/features/auth/data/source/auth_remote_datasource.dart';
import 'package:short_url/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final ConnectivityService networkInfo;

  AuthRepoImpl({required this.remoteDataSource,required this.networkInfo});

  @override
  Future<Either<Failure, AuthModel>> requestOtp({required String email}) async{
    try {
      final user = await remoteDataSource.requestOtp(email:email);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> verifyOTP({required String email, required String otp}) async{
    try {
      final data = await remoteDataSource.verifyOtp(email:email,otp: otp);
      print(data);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
