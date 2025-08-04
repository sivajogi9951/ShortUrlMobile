import 'package:short_url/features/plans/domain/entity/billing_option_entity.dart';

class BillingOptionModel extends BillingOptionEntity {
  BillingOptionModel({
    required super.durationMonths,
    required super.pricePerMonth,
    required super.totalPrice,
    required super.savingsMessage,
    required super.ctaText,
  });

  factory BillingOptionModel.fromJson(Map<String, dynamic> json) {
    return BillingOptionModel(
      durationMonths: json['duration_months']??0,
      pricePerMonth: (json['price_per_month'] as num).toDouble(),
      totalPrice: (json['total_price'] as num).toDouble(),
      savingsMessage: json['savings_message']??'',
      ctaText: json['cta_text'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'duration_months': durationMonths,
      'price_per_month': pricePerMonth,
      'total_price': totalPrice,
      'savings_message': savingsMessage,
      'cta_text': ctaText,
    };
  }
}
