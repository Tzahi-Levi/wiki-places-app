// ================= App Themes =================
import 'package:flutter/material.dart';

class ThemeController {
  static final ThemeController _instance = ThemeController._();
  static ThemeController get instance => _instance;
  ThemeController._();

  static ThemeData get lightMode => ThemeData(
    brightness: Brightness.light,
  );

  static ThemeData get darkMode => ThemeData(
    brightness: Brightness.dark,
  );
}
