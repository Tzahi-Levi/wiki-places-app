// ================= App Themes =================
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeController {
  static final ThemeController instance = ThemeController._();
  ThemeController._();

  static ThemeData get lightMode =>
      ThemeData(
          textTheme: TextTheme(
            headline1: GoogleFonts.openSans(fontSize: 20, color: const Color(0xff393F36), fontWeight: FontWeight.bold),
            headline2: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            headline3: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: const Color(0xff393F36)),
            headline4: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.normal, color: const Color(0xff393F36)),
            headline5: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xff393F36)),
            headline6: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: const Color(0xff393F36)),
            bodyText1: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white),
            bodyText2: GoogleFonts.openSans(fontSize: 13, fontWeight: FontWeight.bold, color: const Color(0xff393F36)),
            subtitle1: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.bold, color: const Color(0xff393F36)),
          ),
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            onBackground: Colors.white,
            surface: Colors.white,
            secondary: Color(0xffaca190),
            onSurface: Colors.black,
            onSecondary: Color(0xff393F36),
            onError: Colors.white,
            error: Colors.red,
            primary: Color(0xff8CD29A),
            onPrimary: Colors.white,
            background: Colors.white,
            primaryContainer: Color(0xff8CD29A),
          ),
          primaryColor: const Color(0xff8CD29A),
          primaryColorDark: Colors.white,
          primaryColorLight: Colors.white.withOpacity(0.8),
          unselectedWidgetColor: const Color(0xff393F36),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, iconTheme: IconThemeData(color: Color(0xff393F36), size: 27)),
          cardTheme: const CardTheme(color: Color(0xff95A68D), shadowColor: Colors.black),
          iconTheme: const IconThemeData(color: Color(0xff393F36), size: 30),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Color(0xff8CD29A)),
      );

  static ThemeData get darkMode => ThemeData(
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
      primaryColor: const Color(0xff393F36),
      primaryColorDark: const Color(0xff393F36),
      primaryColorLight: const Color(0xff393F36),
      unselectedWidgetColor: Colors.white,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent,),
      cardTheme: const CardTheme(color: Color(0xf0707D6A), shadowColor: Colors.black,),
      iconTheme: const IconThemeData(color: Colors.white, size: 30),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Color(0xff262A24),)
  );
}
