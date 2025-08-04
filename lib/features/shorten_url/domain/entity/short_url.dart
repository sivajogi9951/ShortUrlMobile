class ShortUrl {
  final String mainUrl;
  final String shortUrl;
  final String customDomain;
  final int maxClicks;
  final String createdAt;
  final String updatedAt;
  final String expiresAt;

  ShortUrl({
    required this.mainUrl,
    required this.shortUrl,
    required this.customDomain,
    required this.maxClicks,
    required this.createdAt,
    required this.updatedAt,
    required this.expiresAt,
  });
}
