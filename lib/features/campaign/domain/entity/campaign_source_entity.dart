class CampaignSourceEntity {
  final int id;
  final String campaignSourceTag;
  final String? userId;
  final bool isDefault;
  final DateTime updatedAt;
  final String uniqueId;
  final String campaignSourceName;
  final DateTime createdAt;

  const CampaignSourceEntity({
    required this.id,
    required this.campaignSourceTag,
    this.userId,
    required this.isDefault,
    required this.updatedAt,
    required this.uniqueId,
    required this.campaignSourceName,
    required this.createdAt,
  });
}