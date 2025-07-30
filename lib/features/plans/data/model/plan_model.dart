class PlanModel {
  int? id;
  String? name;
  bool? isRecommended;
  String? priceDisplay;
  String? annualPriceDisplay;
  String? ctaText;
  String? description;
  List<String>? features;

  PlanModel({
    this.id,
    this.name,
    this.isRecommended,
    this.priceDisplay,
    this.annualPriceDisplay,
    this.ctaText,
    this.description,
    this.features,
  });

  PlanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    isRecommended = json['is_recommended'] ?? '';
    priceDisplay = json['price_display'] ?? '';
    annualPriceDisplay = json['annual_price_display'] ?? '';
    ctaText = json['cta_text'] ?? '';
    description = json['description'] ?? '';
    features = json['features'] != null ? json['features'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['is_recommended'] = isRecommended;
    data['price_display'] = priceDisplay;
    data['annual_price_display'] = annualPriceDisplay;
    data['cta_text'] = ctaText;
    data['description'] = description;
    data['features'] = features;
    return data;
  }
}
