import 'package:dartz/dartz.dart';
import 'package:short_url/core/error/failure.dart';
import 'package:short_url/features/campaign/domain/entity/campaign_data_entity.dart';

abstract class CampaignRepo {
  Future<Either<Failure, CampaignDataEntity>> getAllCampaigns();
}
