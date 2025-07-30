class ShortUrlModel {
  String? mainUrl;
  String? shortUrl;
  String? customDomain;
  int? maxClicks;
  String? createdAt;
  String? updatedAt;
  String? expiresAt;

  ShortUrlModel(
      {this.mainUrl,
        this.shortUrl,
        this.customDomain,
        this.maxClicks,
        this.createdAt,
        this.updatedAt,
        this.expiresAt});

  ShortUrlModel.fromJson(Map<String, dynamic> json) {
    mainUrl = json['main_url'];
    shortUrl = json['short_url'];
    customDomain = json['custom_domain'];
    maxClicks = json['max_clicks'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    expiresAt = json['expires_at'];
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