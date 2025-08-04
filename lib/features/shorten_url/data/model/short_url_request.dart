class ShortUrlRequest{
  final String? mainURL;
  final String? userId;
  final String? deviceId;
  final String? customDomain;

  ShortUrlRequest({required this.mainURL, required this.userId, required this.deviceId, required this.customDomain});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['main_url'] = mainURL;
    data['user_id'] = userId;
    data['device_id'] = deviceId;
    data['custom_domain'] = customDomain;
    return data;
  }

  ShortUrlRequest copyWith({
    String? mainURL,
    String? userId,
    String? deviceId,
    String? customDomain,
  }) {
    return ShortUrlRequest(
      mainURL: mainURL ?? this.mainURL,
      userId: userId ?? this.userId,
      deviceId: deviceId ?? this.deviceId,
      customDomain: customDomain ?? this.customDomain,
    );
  }
}