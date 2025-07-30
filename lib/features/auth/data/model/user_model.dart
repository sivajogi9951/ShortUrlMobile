class UserModel {
  String? message;
  int? userId;
  bool? isVerified;

  UserModel({this.message, this.userId, this.isVerified});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['user_id'];
    isVerified = json['is_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['user_id'] = userId;
    data['is_verified'] = isVerified;
    return data;
  }
}