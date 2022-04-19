// ================= App Themes =================
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeController {
  static final ThemeController _instance = ThemeController._();

  static ThemeController get instance => _instance;

  ThemeController._();

  static ThemeData get lightMode =>
      ThemeData(
          textTheme: TextTheme(
            headline1: GoogleFonts.openSans(fontSize: 20, color: Colors.white),
            headline2: GoogleFonts.openSans(fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xff3D5B78)),
            headline3: GoogleFonts.openSans(fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.white),
            headline4: GoogleFonts.openSans(fontSize: 12,
                fontWeight: FontWeight.normal,
                color: const Color(0xff37536D)),
              headline5: GoogleFonts.openSans(fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xff37536D)),
            bodyText1: GoogleFonts.openSans(fontSize: 15,
                fontWeight: FontWeight.normal,
                color: const Color(0xff37536D)),
            bodyText2: GoogleFonts.openSans(fontSize: 13,
                fontWeight: FontWeight.bold,
                color: const Color(0xff0051e5)),
          ),
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            onBackground: Colors.white,
            surface: Colors.white,
            secondary: Color(0xffaca190),
            onSurface: Colors.black,
            onSecondary: Colors.white,
            onError: Colors.white,
            error: Colors.red,
            primary: Color(0xff3D5B78),
            onPrimary: Colors.white,
            background: Colors.white,
            primaryContainer: Color(0xff3D5B78),
          ),
          primaryColor: const Color(0xff3D5B78),
          primaryColorDark: Colors.white,
          primaryColorLight: Colors.white.withOpacity(0.8),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
          ),
          cardTheme: const CardTheme(
            color: Color(0x5A69697A),
            shadowColor: Colors.black,
          ),
          iconTheme: const IconThemeData(
              color: Color(0xff3D5B78),
              size: 30
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color(0xff1e2f65),
          )
      );

  static ThemeData get darkMode => ThemeData(
      textTheme: TextTheme(
        headline1: GoogleFonts.openSans(fontSize: 20, color: Colors.white),
        headline2: GoogleFonts.openSans(fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white),
        headline3: GoogleFonts.openSans(fontSize: 15,
            fontWeight: FontWeight.normal,
            color: Colors.white),
        headline4: GoogleFonts.openSans(fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.white),
        headline5: GoogleFonts.openSans(fontSize: 15,
            fontWeight: FontWeight.normal,
            color: Colors.white),
        bodyText1: GoogleFonts.openSans(fontSize: 15,
            fontWeight: FontWeight.normal,
            color: Colors.white),
        bodyText2: GoogleFonts.openSans(fontSize: 13,
            fontWeight: FontWeight.bold,
            color: const Color(0xff0051e5)),
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
      primaryColor: const Color(0xff3D5B78),
      primaryColorDark: const Color(0xff37536D),
      primaryColorLight: const Color(0xff37536D),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
      ),
      cardTheme: const CardTheme(
        color: Color(0x5A69697A),
        shadowColor: Colors.black,
      ),
      iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xff1e2f65),
      )
  );
}
