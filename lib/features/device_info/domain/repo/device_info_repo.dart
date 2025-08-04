import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/device_info/domain/entity/device_info_entity.dart';

abstract class DeviceInfoRepo{
  Future<Either<Failure,DeviceInfoEntity>> getDeviceDetails();

}