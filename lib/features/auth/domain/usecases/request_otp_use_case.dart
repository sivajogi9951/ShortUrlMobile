import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/auth/domain/entity/auth_entity.dart';
import 'package:short_url/features/auth/domain/repo/auth_repo.dart';

class RequestOtpUseCase {
  final AuthRepository repository;

  RequestOtpUseCase(this.repository);

  Future<Either<Failure, AuthEntity>> call(String email){
    return repository.requestOtp(email: email);
  }
}
