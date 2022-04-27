// ================= Theme Switcher =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/theme_controller.dart';
import 'package:wiki_places/metrics/google_analytics.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  void _setTheme(bool isDarkMode) {
    Get.changeTheme(Get.isDarkMode? ThemeController.lightMode : ThemeController.darkMode);
    GoogleAnalytics.instance.logChangeTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(value: Get.isDarkMode, onChanged: _setTheme);
  }
}
