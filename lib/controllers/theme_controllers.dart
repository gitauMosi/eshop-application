import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  // Observable theme mode
  var themeMode = ThemeMode.dark.obs; 
  var isDarkMode = true.obs;  

  @override
  void onInit() {
    super.onInit();
    _loadThemePreference(); 
  }

  // Switch between light and dark themes
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    themeMode.value = isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
    saveThemePreference(isDarkMode.value);
  }

  // Save the theme preference
  Future<void> saveThemePreference(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDark);
  }

  // Load the theme preference from SharedPreferences
  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool('isDarkMode') ?? true;  
    themeMode.value = isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
  }
}
