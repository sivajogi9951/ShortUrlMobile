class PricingModel {
  final String title;
  final String price;
  final String subTitle;
  final List<String> features;

  PricingModel({
    required this.title,
    required this.price,
    required this.subTitle,
    required this.features,
  });
}

List<PricingModel> dummyPricingList = [
  PricingModel(
    title: 'Free',
    price: '0',
    subTitle: 'Basic features for personal use',
    features: [
      '2 Short Links per month',
      'Basic Analytics',
      'No Custom Domain',
    ],
  ),
  PricingModel(
    title: 'Pro',
    price: '9/mo',
    subTitle: 'For professionals and teams',
    features: [
      'All Free Features',
      'Slug name Change',
      'Custom Domains',
      'Advanced Analytics',
      'Priority Support',
    ],
  ),
  PricingModel(
    title: 'Enterprise',
    price: 'Contact Us',
    subTitle: 'Custom solutions for large businesses',
    features: [
      'All Pro Features',
      'Dedicated Account Manager',
      'SLA & Uptime Guarantee',
    ],
  ),
];
