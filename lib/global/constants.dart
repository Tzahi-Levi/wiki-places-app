// ================= Global Constants =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wiki_places/global/types.dart';

class GlobalConstants {
  static final GlobalConstants instance = GlobalConstants._();
  GlobalConstants._();

  // Default Values
  static const EAppPages defaultAppPage = EAppPages.places;
  static String defaultScale = "strKm".tr;
  static const bool defaultIsDarkMode = false;
  static const String defaultRadius = "1";
  static const int defaultPrecision = 1;
  static const double minRadius = 0;
  static const double maxRadius = 5;
  static const double regularPlaceMarkerColor = BitmapDescriptor.hueRed;
  static const double currentPlaceMarkerColor = BitmapDescriptor.hueBlue;
  static const double favoritePlaceMarkerColor = BitmapDescriptor.hueYellow;
  static const double defaultLoadMoreStep = 1;
  static const int defaultWordsInPlaceName = 3;
  static const double defaultInitialRating = 5;
  static const List<String> sendReviewsRecipients = ['razle102030@gmail.com', 'tazachil@gmail.com'];
  static const ThemeMode defaultInitialThemeMode = ThemeMode.light;

  // SearchTextField Default Values
  static const int defaultMinCharsForSuggestions = 1;
  static const int defaultMaxLines = 3;

  // Icons
  static const IconData mapPageSelectedIcon = Icons.map;
  static const IconData placesPageSelectedIcon = Icons.list;
  static const IconData settingsPageSelectedIcon = Icons.settings;
  static const IconData searchIcon = Icons.search;
  static const IconData infoIcon = Icons.info;
  static const IconData filtersIcon = Icons.filter_alt;
  static const IconData addIcon = Icons.add;
  static const IconData placeIcon = Icons.place;
  static const IconData favoriteIcon = Icons.favorite;
  static const IconData nonFavoriteIcon = Icons.favorite_border;
  static const IconData settingsListIcon = Icons.chevron_right;

  // Map
  static const Json defaultInitialMapLocation = {"lat": 32.7775, "lon": 35.02166667}; // Technion Location
  static const double defaultZoomMap = 14;

  // Separators
  static const String firstIconTextSeparator = '@';
  static const String secondIconTextSeparator = '#';

  // Images
  static const String splashPageImage = "images/start_app.png";
  static const String connectionLostImage = "images/connection_lost.png";
  static const String errorPageImage = "images/error_page.png";
  static const String locationPermissionPageImage = "images/location_permission_page.png";
  static const String appIconImage = "images/app_icon.png";
  static const String labIconImage = "images/lab_icon.jpeg";
  static const String walkthroughPathPrefix = "images/walkthrough/";
  static String appBackgroundImage({bool isDarkMode = false}) => "images/background_${isDarkMode ? "dark" : "light"}.png";

  //Links
  static const String connectionLostLink = "https://raw.githubusercontent.com/abuanwar072/20-Error-States-Flutter/master/assets/images/10_Connection%20Lost.png";
  static const String errorPageLink = "https://github.com/abuanwar072/20-Error-States-Flutter";
  static const String locationPermissionPageLink = "https://github.com/abuanwar072/20-Error-States-Flutter";
  static const String appBackgroundLink = "https://pixabay.com/vectors/the-background-wallpaper-sea-blue-292720";
  static const String splashBackgroundLink = "https://cdn.pixabay.com/photo/2021/09/04/13/47/flowers-6597862_960_720.png";

  // Slider
  static int radiusSliderDivisions = 10;
}
