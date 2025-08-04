import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  final SharedPreferences _prefs;
  SharedPrefsService(this._prefs);

  // Shared Prefs Keys
  static const _apiKey = 'api_key';
  static const _deviceId = 'device_id';
  static const _userId = 'user_id';

  //API Key =====================================

  Future<void> saveApiKey(String apiKey) async {
    await _prefs.setString(_apiKey, apiKey);
  }

  String? get apiKey => _prefs.getString(_apiKey);

  Future<void> clearApiKey() async {
    await _prefs.remove(_apiKey);
  }
  //==============================================

  //User Id =====================================

  Future<void> saveUserId(int userId) async {
    await _prefs.setInt(_userId, userId);
  }

  int? get userId => _prefs.getInt(_userId);

  Future<void> clearUserId() async {
    await _prefs.remove(_userId);
  }
  //==============================================

  //Device Id =====================================

  Future<void> saveDeviceId(String deviceId) async {
    await _prefs.setString(_deviceId, deviceId);
  }

  String? get deviceId => _prefs.getString(_deviceId);

  Future<void> clearDeviceId() async {
    await _prefs.remove(_deviceId);
  }
  //==============================================

  //Clear All =====================================
  Future<void> clearSharedPre() async {
    await _prefs.clear();
  }

}