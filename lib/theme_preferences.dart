import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const String _themeKey = 'user_theme';

  // Save the user's theme preference
  static Future<void> saveThemePreference(String theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, theme);
  }

  // Retrieve the user's theme preference
  static Future<String?> getThemePreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_themeKey);
  }
}
