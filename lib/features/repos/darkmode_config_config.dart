import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkmodeConfigRepository {
  static const String _darkMode = "darkMode";
  SharedPreferences _preferences;

  DarkmodeConfigRepository(this._preferences);

  Future<void> setDark(bool value) async {
    _preferences.setBool(_darkMode, value);
  }

  bool isDark() {
    /*if (_preferences.getBool(_darkMode) == true) {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }*/
    return _preferences.getBool(_darkMode) ?? false;
  }
}
