import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePrefrences {
  static const Theme_Status = "Theme_Status";

  Future<bool> getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(Theme_Status) ?? false;
  }

  setThemeMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(Theme_Status, value);
  }
}
