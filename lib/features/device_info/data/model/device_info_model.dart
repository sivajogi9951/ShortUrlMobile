
import 'package:short_url/features/device_info/domain/entity/device_info_entity.dart';

class DeviceInfoModel extends DeviceInfoEntity {
  DeviceInfoModel({
    required super.ipAddress,
    required super.isMobile,
    required super.deviceName,
    required super.browser,
    required super.os,
    required super.fingerprint,
  });

  factory DeviceInfoModel.fromJson(Map<String, dynamic> json) {
    return DeviceInfoModel(
      ipAddress: json['ip_address'] ?? '',
      isMobile: json['is_mobile'] ?? false,
      deviceName: json['device_name'] ?? '',
      browser: json['browser'] ?? '',
      os: json['os'] ?? '',
      fingerprint: json['fingerprint'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ip_address': ipAddress,
      'is_mobile': isMobile,
      'device_name': deviceName,
      'browser': browser,
      'os': os,
      'fingerprint': fingerprint,
    };
  }
}
