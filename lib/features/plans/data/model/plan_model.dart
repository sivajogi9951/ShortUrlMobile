import 'package:short_url/features/plans/data/model/billing_option_model.dart';
import 'package:short_url/features/plans/domain/entity/plan_entity.dart';

class PlanModel extends PlanEntity {
  PlanModel({
    required super.id,
    required super.name,
    required super.description,
    required super.isRecommended,
    required super.features,
    required super.billingOptions,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      id: json['id']??0,
      name: json['name'].toString(),
      description: json['description'].toString(),
      isRecommended: json['is_recommended']??false,
      features: List<String>.from(json['features'] ?? []),
      billingOptions: (json['billing_options'] as List)
          .map((e) => BillingOptionModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'is_recommended': isRecommended,
      'features': features,
      'billing_options': billingOptions
          .map((e) => (e as BillingOptionModel).toJson())
          .toList(),
    };
  }
}
