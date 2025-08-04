import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/exceptions.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/qr_code/data/source/qr_code_remote_datasource.dart';
import 'package:short_url/features/qr_code/domain/entity/qr_code.dart';
import 'package:short_url/features/qr_code/domain/repo/qr_code_repo.dart';

class QrCodeRepoImpl implements QrCodeRepo{
  final QrCodeRemoteDataSource remoteDataSource;

  QrCodeRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, QrCodeEntity>> generateQrCode({required String url}) async{
    try {
      final QrCodeEntity plans = await remoteDataSource.generateQrCode(url: url);
      return Right(plans);
    } on NetworkException catch (e) {
      return left(ConnectionFailure(message:e.message));
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    }  catch (e) {
      return left(UnknownFailure(message: 'Unknown : ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<QrCodeEntity>>> getGeneratedQrCodes() async{
    try {
      final List<QrCodeEntity> qrCodes = await remoteDataSource.getGeneratedQrCodes();
      return Right(qrCodes);
    } on NetworkException catch (e) {
      return left(ConnectionFailure(message:e.message));
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    }  catch (e) {
      return left(UnknownFailure(message: 'Unknown : ${e.toString()}'));
    }
  }

}