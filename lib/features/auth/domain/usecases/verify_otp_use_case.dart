import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/auth/domain/entity/auth_entity.dart';
import 'package:short_url/features/auth/domain/repo/auth_repo.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<Either<Failure, AuthEntity>> call(String email, String otp) {
    return repository.verifyOTP(email: email, otp: otp);
  }
}
