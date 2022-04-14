// ================= Global Constants =================
import 'package:flutter/material.dart';

class GlobalConstants {
  static final GlobalConstants _instance = GlobalConstants._();
  static GlobalConstants get instance => _instance;
  GlobalConstants._();

  // Icons
  static const IconData mapPageOutLinedIcon = Icons.map_outlined;
  static const IconData mapPageSelectedIcon = Icons.map;
  static const IconData placesPageOutLinedIcon = Icons.home_outlined;
  static const IconData placesPageSelectedIcon= Icons.home;

  // Images
  static const String connectionLostImage = "images/connection_lost.png";
}
