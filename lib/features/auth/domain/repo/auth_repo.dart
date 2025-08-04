import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/auth/data/model/auth_model.dart';
import 'package:short_url/features/auth/domain/entity/auth_entity.dart';

abstract class AuthRepository{
  Future<Either<Failure, AuthEntity>> requestOtp({required String email});
  Future<Either<Failure, AuthEntity>> verifyOTP({required String email,required String otp});
}