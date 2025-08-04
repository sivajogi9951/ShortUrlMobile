import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/device_info/domain/entity/device_info_entity.dart';
import 'package:short_url/features/device_info/domain/repo/device_info_repo.dart';

class GetDeviceInfoUseCase{

  final DeviceInfoRepo repo;

  GetDeviceInfoUseCase({required this.repo});

  Future<Either<Failure, DeviceInfoEntity>> call(){
    return repo.getDeviceDetails();
  }


}