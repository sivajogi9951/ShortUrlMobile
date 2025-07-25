import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  final SharedPreferences _prefs;

  SharedPrefsService(this._prefs);

  // =============================
  // Keys
  // =============================
  static const String _keyUserToken = 'user_token';
  static const String _keyIsFirstLaunch = 'is_first_launch';
  static const String _keyThemeMode = 'theme_mode'; // 'light', 'dark'

  // =============================
  // Generic Methods
  // =============================

  Future<void> saveString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String? getString(String key) => _prefs.getString(key);

  Future<void> saveBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  bool? getBool(String key) => _prefs.getBool(key);

  Future<void> saveInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  int? getInt(String key) => _prefs.getInt(key);

  Future<void> saveDouble(String key, double value) async {
    await _prefs.setDouble(key, value);
  }

  double? getDouble(String key) => _prefs.getDouble(key);

  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  Future<void> clearAll() async {
    await _prefs.clear();
  }

  bool containsKey(String key) => _prefs.containsKey(key);

  // =============================
  // Typed Methods (recommended)
  // =============================

  Future<void> saveUserToken(String token) async {
    await saveString(_keyUserToken, token);
  }

  String? getUserToken() => getString(_keyUserToken);

  Future<void> removeUserToken() async {
    await remove(_keyUserToken);
  }

  Future<void> setFirstLaunch(bool value) async {
    await saveBool(_keyIsFirstLaunch, value);
  }

  bool isFirstLaunch() => getBool(_keyIsFirstLaunch) ?? true;

  Future<void> setThemeMode(String mode) async {
    await saveString(_keyThemeMode, mode); // light, dark
  }

  String getThemeMode() => getString(_keyThemeMode) ?? 'light';

  // =============================
  // Debug/Dev Utilities
  // =============================

  void printAllPrefs() {
    // final allKeys = _prefs.getKeys();
    // for (final key in allKeys) {
    //   print('[$key]: ${_prefs.get(key)}');
    // }
  }
}
