class CampaignMediumEntity {
  final int id;
  final String? userId;
  final DateTime createdAt;
  final String campaignMediumName;
  final String uniqueId;
  final String campaignMediumTag;
  final bool isDefault;
  final DateTime updatedAt;

  const CampaignMediumEntity({
    required this.id,
    this.userId,
    required this.createdAt,
    required this.campaignMediumName,
    required this.uniqueId,
    required this.campaignMediumTag,
    required this.isDefault,
    required this.updatedAt,
  });
}
