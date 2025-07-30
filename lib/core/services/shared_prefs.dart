import 'package:shared_preferences/shared_preferences.dart';
import 'package:short_url/features/auth/data/model/user_model.dart';

class SharedPrefs {
  static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userId', user.userId??-1);
    await prefs.setBool('isVerified', user.isVerified??false);
    await prefs.setString('message', user.message??'');
  }

  static Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final message = prefs.getString('message');
    final isVerified = prefs.getBool('isVerified');
    final id = prefs.getInt('userId');
    if (message != null && isVerified != null && id != null) {
      return UserModel(message: message, isVerified: isVerified,userId: id);
    }
    return null;
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}