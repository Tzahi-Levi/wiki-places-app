// ================= App Themes =================
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wiki_places/controllers/preferences_controller.dart';

class ThemeController {
  static final ThemeController instance = ThemeController._();
  ThemeController._();

  static final _primaryColor_light = const Color(0xff24A52E);
  static final _primaryColorLight_light = const Color(0xffE1EEDA);
  static final _primaryColorDark_light = const Color(0xff8BC14C);
  static final _primaryColor_dark = const Color(0xff031334);
  static final _primaryColorLight_dark = Colors.blueGrey.withOpacity(0.95);
  static final _primaryColorDark_dark = const Color(0xff164872);

  static ThemeData get lightMode => ThemeData.light().copyWith(
      textTheme: TextTheme(
        headline1: GoogleFonts.openSans(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        headline2: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        headline3: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white),
        headline4: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black87),
        headline5: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.bold, color: _primaryColor_light),
        headline6: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black87),
        bodyText1: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black87),
        bodyText2: GoogleFonts.openSans(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black87),
        subtitle1: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        onBackground: Colors.white,
        surface: Colors.white,
        secondary: _primaryColorLight_light,
        onSurface: Colors.black,
        onSecondary: Colors.black,
        onError: Colors.white,
        error: Colors.red,
        primary: _primaryColor_light,
        onPrimary: Colors.white,
        background: Colors.white,
        primaryContainer: _primaryColor_light,
      ),
      primaryColor: _primaryColor_light,
      primaryColorDark: _primaryColorDark_light,
      primaryColorLight: _primaryColorLight_light,
      bottomAppBarColor: Colors.white,
      unselectedWidgetColor: Colors.black87,
      highlightColor: _primaryColor_light,
      focusColor: _primaryColorLight_light,
      indicatorColor: Colors.black87,
      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent, iconTheme: IconThemeData(color: Colors.white, size: 27), systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black.withOpacity(0.4))),
      cardTheme: CardTheme(color: Colors.white.withOpacity(0.8), shadowColor: Colors.black),
      iconTheme: const IconThemeData(color: Colors.white, size: 30),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: _primaryColor_light),
      radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all(_primaryColor_light)),
      checkboxTheme: CheckboxThemeData(fillColor: MaterialStateProperty.all(_primaryColor_light)),
      canvasColor: Colors.white.withOpacity(0.95));

  static ThemeData get darkMode => ThemeData.dark().copyWith(
      textTheme: TextTheme(
        headline1: GoogleFonts.openSans(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        headline2: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        headline3: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white),
        headline4: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white),
        headline5: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        headline6: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white),
        bodyText1: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white),
        bodyText2: GoogleFonts.openSans(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
        subtitle1: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        onBackground: Colors.white,
        surface: Colors.white,
        secondary: _primaryColorLight_light,
        onSurface: Colors.black,
        onSecondary: Colors.white,
        onError: Colors.white,
        error: Colors.red,
        primary: Colors.white,
        onPrimary: Colors.white,
        background: Colors.white,
        primaryContainer: Colors.white,
      ),
      primaryColor: _primaryColor_dark,
      primaryColorDark: _primaryColorDark_dark,
      primaryColorLight: _primaryColorLight_dark,
      unselectedWidgetColor: _primaryColor_dark,
      focusColor: _primaryColorDark_dark,
      highlightColor: Colors.white,
      indicatorColor: Colors.white,
      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent, iconTheme: IconThemeData(color: Colors.white, size: 27), systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black.withOpacity(0.4))),
      cardTheme: CardTheme(color: Colors.blueGrey.withOpacity(0.8), shadowColor: Colors.black),
      iconTheme: const IconThemeData(color: Colors.white, size: 30),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: _primaryColorDark_dark),
      radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all(_primaryColor_dark)),
      checkboxTheme: CheckboxThemeData(fillColor: MaterialStateProperty.all(_primaryColor_dark)),
      switchTheme: SwitchThemeData(thumbColor: MaterialStateProperty.all(Colors.white), trackColor: MaterialStateProperty.all(Colors.white70)),
      canvasColor: _primaryColorLight_dark
  );

  static void setTheme({required bool isDarkMode}) {
    Get.changeTheme(
        isDarkMode ? ThemeController.darkMode : ThemeController.lightMode);
    PreferencesController.instance.setIsDarkMode(isDarkMode: isDarkMode);
  }

  static void changeTheme() {
    Get.changeTheme(
        Get.isDarkMode ? ThemeController.lightMode : ThemeController.darkMode);
    PreferencesController.instance.setIsDarkMode(isDarkMode: !Get.isDarkMode);
  }
}
