import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/auth/data/model/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> sendOtp({required String email});
  Future<Either<Failure, UserModel>> verifyOTP({required String email,required String otp});
  Future<Either<Failure, UserModel>> login({required String email});
}