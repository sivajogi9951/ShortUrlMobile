import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/auth/data/model/user_model.dart';
import 'package:short_url/features/auth/domain/repo/auth_repo.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<Either<Failure, UserModel>> call(String email, String otp) {
    return repository.verifyOTP(email: email, otp: otp);
  }
}
