import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class SharedPrefsService {
  static const String _userKey = 'current_user';
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _themeKey = 'app_theme';
  static const String _firstLaunchKey = 'first_launch';

  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // User methods
  static Future<void> saveUser(UserModel user) async {
    final userMap = user.toMap();
    final userJson = userMap.entries.map((e) => '${e.key}:${e.value}').join('|');
    await _prefs.setString(_userKey, userJson);
    await _prefs.setBool(_isLoggedInKey, true);
  }

  static UserModel? getUser() {
    final userJson = _prefs.getString(_userKey);
    if (userJson == null) return null;

    try {
      final userMap = <String, dynamic>{};
      final pairs = userJson.split('|');
      for (final pair in pairs) {
        final keyValue = pair.split(':');
        if (keyValue.length == 2) {
          userMap[keyValue[0]] = keyValue[1];
        }
      }
      return UserModel.fromMap(userMap);
    } catch (e) {
      return null;
    }
  }

  static Future<void> clearUser() async {
    await _prefs.remove(_userKey);
    await _prefs.setBool(_isLoggedInKey, false);
  }

  static bool isLoggedIn() {
    return _prefs.getBool(_isLoggedInKey) ?? false;
  }

  // Theme methods
  static Future<void> setTheme(bool isDark) async {
    await _prefs.setBool(_themeKey, isDark);
  }

  static bool getTheme() {
    return _prefs.getBool(_themeKey) ?? false;
  }

  // First launch methods
  static Future<void> setFirstLaunch(bool isFirstLaunch) async {
    await _prefs.setBool(_firstLaunchKey, isFirstLaunch);
  }

  static bool isFirstLaunch() {
    return _prefs.getBool(_firstLaunchKey) ?? true;
  }

  // Clear all data
  static Future<void> clearAll() async {
    await _prefs.clear();
  }
}
