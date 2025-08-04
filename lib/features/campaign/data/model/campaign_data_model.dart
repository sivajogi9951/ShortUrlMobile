import 'package:short_url/features/campaign/data/model/campaign_medium_model.dart';
import 'package:short_url/features/campaign/data/model/campaign_source_model.dart';
import 'package:short_url/features/campaign/domain/entity/campaign_data_entity.dart';

class CampaignDataModel extends CampaignDataEntity {
  CampaignDataModel({
    required List<CampaignSourceModel> super.sources,
    required List<CampaignMediumModel> super.mediums,
    required super.names,
  });

  factory CampaignDataModel.fromJson(Map<String, dynamic> json) {
    return CampaignDataModel(
      sources: (json['sources'] as List)
          .map((e) => CampaignSourceModel.fromJson(e))
          .toList(),
      mediums: (json['mediums'] as List)
          .map((e) => CampaignMediumModel.fromJson(e))
          .toList(),
      names: json['names'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sources': sources
          .map((e) => (e as CampaignSourceModel).toJson())
          .toList(),
      'mediums': mediums
          .map((e) => (e as CampaignMediumModel).toJson())
          .toList(),
      'names': names,
    };
  }
}
