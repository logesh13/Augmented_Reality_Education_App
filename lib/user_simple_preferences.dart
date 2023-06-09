import 'package:shared_preferences/shared_preferences.dart';

class userSimplePreferences {
  static SharedPreferences _preferences;

  static const _keyprogres = "50";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUsername(String progress) async =>
      await _preferences.setString(_keyprogres, progress);

  static String getProgress() => _preferences.getString(_keyprogres);
}
