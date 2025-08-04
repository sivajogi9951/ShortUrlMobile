import 'package:short_url/features/campaign/domain/entity/campaign_source_entity.dart';

class CampaignSourceModel extends CampaignSourceEntity {
  const CampaignSourceModel({
    required super.id,
    required super.campaignSourceTag,
    super.userId,
    required super.isDefault,
    required super.updatedAt,
    required super.uniqueId,
    required super.campaignSourceName,
    required super.createdAt,
  });

  factory CampaignSourceModel.fromJson(Map<String, dynamic> json) {
    return CampaignSourceModel(
      id: json['id'] as int,
      campaignSourceTag: json['campaign_source_tag'] as String,
      userId: json['user_id'] as String?,
      isDefault: json['is_default'] as bool,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      uniqueId: json['unique_id'] as String,
      campaignSourceName: json['campaign_source_name'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'campaign_source_tag': campaignSourceTag,
      'user_id': userId,
      'is_default': isDefault,
      'updated_at': updatedAt.toIso8601String(),
      'unique_id': uniqueId,
      'campaign_source_name': campaignSourceName,
      'created_at': createdAt.toIso8601String(),
    };
  }
}