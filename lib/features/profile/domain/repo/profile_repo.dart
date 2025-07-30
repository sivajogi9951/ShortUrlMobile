import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/profile/data/model/profile_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileModel>> getProfileDetails();
}
