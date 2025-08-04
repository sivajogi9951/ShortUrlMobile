class DeviceInfoEntity {
  final String ipAddress;
  final bool isMobile;
  final String deviceName;
  final String browser;
  final String os;
  final String fingerprint;

  DeviceInfoEntity({
    required this.ipAddress,
    required this.isMobile,
    required this.deviceName,
    required this.browser,
    required this.os,
    required this.fingerprint,
  });
}
