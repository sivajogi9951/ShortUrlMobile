import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/profile/data/model/profile_model.dart';
import 'package:short_url/features/profile/domain/repo/profile_repo.dart';

class UserDetailsUseCase{
  final ProfileRepo profileRepo;

  UserDetailsUseCase({required this.profileRepo});

  Future<Either<Failure, ProfileModel>> call() {
    return profileRepo.getProfileDetails();
  }
}