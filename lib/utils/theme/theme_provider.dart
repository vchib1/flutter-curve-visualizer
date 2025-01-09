import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  final SharedPreferences pref;

  ThemeProvider({required this.pref});

  ThemeMode getThemeMode() {
    final isDarkMode = pref.getBool('darkMode') ?? false;
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggleTheme() async {
    final isDarkMode = pref.getBool('darkMode') ?? false;
    pref.setBool('darkMode', !isDarkMode);
    notifyListeners();
  }
}
