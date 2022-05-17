// ================= Global Constants =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  static const double currentPlaceMarkerColor = BitmapDescriptor.hueBlue;
  static const double defaultLoadMoreStep = 1;
  static const int defaultWordsInPlaceName = 3;

  // Icons
  static const IconData mapPageOutLinedIcon = Icons.map_outlined;
  static const IconData mapPageSelectedIcon = Icons.map;
  static const IconData placesPageOutLinedIcon = Icons.home_outlined;
  static const IconData placesPageSelectedIcon = Icons.home;
  static const IconData searchIcon = Icons.search;
  static const IconData infoIcon = Icons.info;
  static const IconData refreshIcon = Icons.refresh;
  static const IconData addIcon = Icons.add;
  static const IconData placeIcon = Icons.place;

  // Map
  static const Json defaultInitialMapLocation = {"lat": 32.7775, "lon": 35.02166667}; // Technion Location
  static const double defaultZoomMap = 15;

  // Separators
  static const String firstIconTextSeparator = '@';
  static const String secondIconTextSeparator = '#';

  // Images
  static const String connectionLostImage = "images/connection_lost.png";
  static const String errorPageImage = "images/error_page.png";
  static const String appIconImage = "images/app_icon.png";
  static String get appBackgroundImage => "images/background_${Get.isDarkMode ? "dark" : "light"}.png";

  //Links
  static const String connectionLostLink = "https://raw.githubusercontent.com/abuanwar072/20-Error-States-Flutter/master/assets/images/1_No%20Connection.png";
  static const String errorPageLink = "https://github.com/abuanwar072/20-Error-States-Flutter";
  static const String appBackgroundLink = "https://cdn.pixabay.com/photo/2021/09/04/13/47/flowers-6597862_960_720.png";

  // Slider
  static int radiusSliderDivisions = 10;
}
