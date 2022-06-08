// ================= Theme Switcher =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/theme_controller.dart';
import 'package:wiki_places/metrics/google_analytics.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  bool _isDarkMode = Get.isDarkMode;

  void _setTheme(bool isDarkMode) {
    ThemeController.changeTheme();
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
    GoogleAnalytics.instance.logChangeTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(value: _isDarkMode, onChanged: _setTheme);
  }
}
