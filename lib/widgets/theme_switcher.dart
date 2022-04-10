// ================= Theme Switcher =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/theme_controller.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  void _setTheme(bool isDarkMode) {
    Get.changeTheme(Get.isDarkMode? ThemeController.lightMode : ThemeController.darkMode);
  }

  @override
  Widget build(BuildContext context) {
    return Switch(value: Get.isDarkMode, onChanged: _setTheme);
  }
}
