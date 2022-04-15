// ================= Global Constants =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalConstants {
  static final GlobalConstants _instance = GlobalConstants._();
  static GlobalConstants get instance => _instance;
  GlobalConstants._();

  // Default Values
  static String defaultScale = "strKm".tr;
  static const int defaultPrecision = 1;

  // Icons
  static const IconData mapPageOutLinedIcon = Icons.map_outlined;
  static const IconData mapPageSelectedIcon = Icons.map;
  static const IconData placesPageOutLinedIcon = Icons.home_outlined;
  static const IconData placesPageSelectedIcon = Icons.home;
  static const IconData searchIcon = Icons.search;
  static const IconData updateRadiusIcon = Icons.arrow_upward; // TODO- should be changed

  // Separators
  static const String iconTextSeparator = '@';

  // Images
  static const String connectionLostImage = "images/connection_lost.png";
}
