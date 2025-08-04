import 'package:short_url/features/auth/domain/entity/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.message,
    required super.apiKey,
    required super.userId,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      message: json['message'] ?? '',
      apiKey: json['api_key'] ?? '',
      userId: json['user_id'] ?? -1,
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'api_key': apiKey, 'user_id': userId};
  }
}
