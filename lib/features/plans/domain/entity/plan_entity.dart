import 'package:short_url/features/plans/domain/entity/billing_option_entity.dart';

class PlanEntity {
  final int id;
  final String name;
  final String description;
  final bool isRecommended;
  final List<String> features;
  final List<BillingOptionEntity> billingOptions;

  PlanEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.isRecommended,
    required this.features,
    required this.billingOptions,
  });
}