class BillingOptionEntity {
  final int durationMonths;
  final double pricePerMonth;
  final double totalPrice;
  final String savingsMessage;
  final String ctaText;

  BillingOptionEntity({
    required this.durationMonths,
    required this.pricePerMonth,
    required this.totalPrice,
    required this.savingsMessage,
    required this.ctaText,
  });
}
