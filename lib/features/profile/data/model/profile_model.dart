import 'package:short_url/features/plans/data/model/plan_model.dart';

class ProfileModel {
  int? id;
  String? email;
  bool? isVerified;
  int? urlLimit;
  PlanModel? currentPlan;

  ProfileModel({
    this.id,
    this.email,
    this.isVerified,
    this.urlLimit,
    this.currentPlan,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    isVerified = json['is_verified'];
    urlLimit = json['url_limit'];
    currentPlan = json['current_plan'] != null
        ? PlanModel.fromJson(json['current_plan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['is_verified'] = isVerified;
    data['url_limit'] = urlLimit;
    if (currentPlan != null) {
      data['current_plan'] = currentPlan!.toJson();
    }
    return data;
  }
}
