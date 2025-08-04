import 'package:short_url/features/campaign/domain/entity/campaign_medium_entity.dart';
import 'package:short_url/features/campaign/domain/entity/campaign_source_entity.dart';

class CampaignDataEntity {
  final List<CampaignSourceEntity> sources;
  final List<CampaignMediumEntity> mediums;
  final List<dynamic> names;

  CampaignDataEntity({
    required this.sources,
    required this.mediums,
    required this.names,
  });
}