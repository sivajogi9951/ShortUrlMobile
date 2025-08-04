import 'package:short_url/features/campaign/domain/entity/campaign_medium_entity.dart';

class CampaignMediumModel extends CampaignMediumEntity {
  const CampaignMediumModel({
    required super.id,
    super.userId,
    required super.createdAt,
    required super.campaignMediumName,
    required super.uniqueId,
    required super.campaignMediumTag,
    required super.isDefault,
    required super.updatedAt,
  });

  factory CampaignMediumModel.fromJson(Map<String, dynamic> json) {
    return CampaignMediumModel(
      id: json['id'] as int,
      userId: json['user_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      campaignMediumName: json['campaign_medium_name'] as String,
      uniqueId: json['unique_id'] as String,
      campaignMediumTag: json['campaign_medium_tag'] as String,
      isDefault: json['is_default'] as bool,
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'created_at': createdAt.toIso8601String(),
      'campaign_medium_name': campaignMediumName,
      'unique_id': uniqueId,
      'campaign_medium_tag': campaignMediumTag,
      'is_default': isDefault,
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}