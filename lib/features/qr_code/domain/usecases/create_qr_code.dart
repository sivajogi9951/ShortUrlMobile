import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/qr_code/domain/entity/qr_code.dart';
import 'package:short_url/features/qr_code/domain/repo/qr_code_repo.dart';

class CreateQrCodeUserCase{
  final QrCodeRepo repo;

  CreateQrCodeUserCase({required this.repo});
  Future<Either<Failure, QrCodeEntity>> call({required String url}) {
    return repo.generateQrCode(url: url);
  }
}