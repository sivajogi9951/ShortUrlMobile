import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/exceptions.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/device_info/data/model/device_info_model.dart';
import 'package:short_url/features/device_info/data/source/device_info_remote_datasource.dart';
import 'package:short_url/features/device_info/domain/entity/device_info_entity.dart';
import 'package:short_url/features/device_info/domain/repo/device_info_repo.dart';

class DeviceInfoRepoImpl implements DeviceInfoRepo{
  final DeviceInfoRemoteDataSource remote;

  DeviceInfoRepoImpl({required this.remote});
  @override
  Future<Either<Failure, DeviceInfoEntity>> getDeviceDetails() async{
    try {
      final DeviceInfoModel deviceInfo = await remote.getDeviceDetails();
      return Right(deviceInfo);
    } on NetworkException catch (e) {
      return left(ConnectionFailure(message:e.message));
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    }  catch (e) {
      return left(UnknownFailure(message: 'Unknown : ${e.toString()}'));
    }
  }

}