import 'package:short_url/features/shorten_url/domain/entity/short_url.dart';

class ShortUrlModel extends ShortUrl {
  ShortUrlModel({
    required super.mainUrl,
    required super.shortUrl,
    required super.customDomain,
    required super.maxClicks,
    required super.createdAt,
    required super.updatedAt,
    required super.expiresAt,
  });
  factory ShortUrlModel.fromJson(Map<String, dynamic> json) {
    return ShortUrlModel(
      mainUrl: json['main_url'] ?? '',
      shortUrl: json['short_url'] ?? '',
      customDomain: json['custom_domain'] ?? '',
      maxClicks: json['max_clicks'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'],
      expiresAt: json['expires_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['main_url'] = mainUrl;
    data['short_url'] = shortUrl;
    data['custom_domain'] = customDomain;
    data['max_clicks'] = maxClicks;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['expires_at'] = expiresAt;
    return data;
  }
}
