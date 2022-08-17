import 'package:flutter/material.dart';
import 'package:groceryapp/services/darkTheme_pref.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePrefrences darkthemepref = DarkThemePrefrences();
  bool _darkMode = false;

  bool get getThemeMode => _darkMode;

  set setThemeMode(bool value) {
    _darkMode = value;
    darkthemepref.setThemeMode(_darkMode);
    notifyListeners();
  }
}
