class QrCodeRequest {
  final String? link;
  final String? userId;
  final String? deviceId;

  QrCodeRequest({
    this.link,
    this.userId,
    this.deviceId,
  });

  factory QrCodeRequest.fromJson(Map<String, dynamic> json) {
    return QrCodeRequest(
      link: json['link'] as String?,
      userId: json['user_id'] as String?,
      deviceId: json['device_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'link': link,
      'user_id': userId??'',
      'device_id': deviceId??'',
    };
  }

  QrCodeRequest copyWith({
    String? link,
    String? userId,
    String? deviceId,
  }) {
    return QrCodeRequest(
      link: link ?? this.link,
      userId: userId ?? this.userId,
      deviceId: deviceId ?? this.deviceId,
    );
  }
}