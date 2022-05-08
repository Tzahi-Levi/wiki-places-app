// ================= Global Constants =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/types.dart';

class GlobalConstants {
  static final GlobalConstants _instance = GlobalConstants._();
  static GlobalConstants get instance => _instance;
  GlobalConstants._();

  // Default Values
  static String defaultScale = "strKm".tr;
  static const int defaultPrecision = 1;
  static const double minRadius = 0;
  static const double maxRadius = 5;
  static const int defaultMinAbstractWords = 4;

  // Icons
  static const IconData mapPageOutLinedIcon = Icons.map_outlined;
  static const IconData mapPageSelectedIcon = Icons.map;
  static const IconData placesPageOutLinedIcon = Icons.home_outlined;
  static const IconData placesPageSelectedIcon = Icons.home;
  static const IconData searchIcon = Icons.search;
  static const IconData updateRadiusIcon = Icons.radar_outlined;
  static const IconData aboutTheAppIcon = Icons.info;

  // Map
  static const Json defaultInitialMapLocation = {"lat": 32.7775, "lon": 35.02166667}; // Technion Location
  static const double defaultZoomMap = 16;

  // Separators
  static const String firstIconTextSeparator = '@';
  static const String secondIconTextSeparator = '#';

  // Images
  static const String connectionLostImage = "images/connection_lost.png";
  static const String errorPageImage = "images/error_page.png";
  static const String appIconImage = "images/app_icon.png";
  static const String appBackgroundImage = "images/Background.png";
  static const String appBackgroundDarkImage = "images/DarkBackground.png";

  // Slider
  static int radiusSliderDivisions = 10;
}
