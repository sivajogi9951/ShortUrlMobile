import 'package:short_url/features/qr_code/domain/entity/qr_code.dart';

class QrCodeModel extends QrCodeEntity {
  QrCodeModel({
    required super.id,
    required super.link,
    required super.imageUrl,
    required super.createdAt,
  });

  factory QrCodeModel.fromJson(Map<String, dynamic> json) {
    return QrCodeModel(
      id: json['id'] ?? 0,
      link: json['link'] ?? '',
      imageUrl: json['image_url'] ?? '',
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'link': link,
      'image_url': imageUrl,
      'created_at': createdAt,
    };
  }
}