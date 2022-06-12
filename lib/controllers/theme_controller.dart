// ================= App Themes =================
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wiki_places/controllers/preferences_controller.dart';

class ThemeController {
  static final ThemeController instance = ThemeController._();
  ThemeController._();

  static ThemeData get lightMode => ThemeData.light().copyWith(
        textTheme: TextTheme(
          headline1: GoogleFonts.openSans(fontSize: 20, color:  Colors.white, fontWeight: FontWeight.bold),
          headline2: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
          headline3: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white),
          headline4: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black87),
          headline5: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
          headline6: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black87),
          bodyText1: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black87),
          bodyText2: GoogleFonts.openSans(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black87),
          subtitle1: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          onBackground: Colors.white,
          surface: Colors.white,
          secondary: Color(0xffE1EEDA),
          onSurface: Colors.black,
          onSecondary: Colors.black,
          onError: Colors.white,
          error: Colors.red,
          primary: Color(0xff24A52E),
          onPrimary: Colors.white,
          background: Colors.white,
          primaryContainer: Color(0xff24A52E),
        ),
        primaryColor: const Color(0xff24A52E),
        primaryColorDark: const Color(0xff8BC14C),
        primaryColorLight: const Color(0xffE1EEDA),
        bottomAppBarColor: Colors.white,
        unselectedWidgetColor: Colors.black38,
        highlightColor: const Color(0xff24A52E),
        focusColor: const Color(0xffE1EEDA),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, iconTheme: IconThemeData(color: Colors.white, size: 27), systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent,),),
        cardTheme: CardTheme(color: Colors.white.withOpacity(0.8), shadowColor: Colors.black),
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Color(0xff24A52E)),
        radioTheme:  RadioThemeData(fillColor:  MaterialStateProperty.all(const Color(0xff24A52E))),
    checkboxTheme: CheckboxThemeData(fillColor: MaterialStateProperty.all(const Color(0xff24A52E)))
    );

  static ThemeData get darkMode => ThemeData.dark().copyWith(
      textTheme: TextTheme(
        headline1: GoogleFonts.openSans(fontSize: 20, color: Colors.white),
        headline2: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        headline3: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white),
        headline4: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white),
        headline5: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        headline6: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white),
        bodyText1: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white),
        bodyText2: GoogleFonts.openSans(fontSize: 13, fontWeight: FontWeight.bold, color:  Colors.white),
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        onBackground: Colors.white,
        surface: Colors.white,
        secondary: Color(0xffaca190),
        onSurface: Colors.black,
        onSecondary: Colors.white,
        onError: Colors.white,
        error: Colors.red,
        primary: Colors.white,
        onPrimary: Color(0xff3D5B78),
        background: Color(0xff3D5B78),
        primaryContainer: Colors.white ,
      ),
      primaryColor: const Color(0xff41BD3D),
      primaryColorDark: const Color(0xff393F36),
      primaryColorLight: const Color(0xff83C643),
      unselectedWidgetColor: Colors.white,
      focusColor: const Color(0xff528D59),
      highlightColor: const Color(0xff24A52E),
      appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, iconTheme: IconThemeData(color: Colors.white, size: 27)),
      cardTheme: const CardTheme(color: Color(0xf0707D6A), shadowColor: Colors.black,),
      iconTheme: const IconThemeData(color: Colors.white, size: 30),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Color(0xff262A24),)
  );

  static void setTheme({required bool isDarkMode}) {
    Get.changeTheme(isDarkMode?  ThemeController.darkMode : ThemeController.lightMode);
    PreferencesController.instance.setIsDarkMode(isDarkMode: isDarkMode);
  }

  static void changeTheme() {
    Get.changeTheme(Get.isDarkMode? ThemeController.lightMode : ThemeController.darkMode);
    PreferencesController.instance.setIsDarkMode(isDarkMode: !Get.isDarkMode);
  }
}
