import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/qr_code/domain/entity/qr_code.dart';

abstract class QrCodeRepo {
  Future<Either<Failure, QrCodeEntity>> generateQrCode({required String url});
  Future<Either<Failure, List<QrCodeEntity>>> getGeneratedQrCodes();
}
