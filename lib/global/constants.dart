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
  static const String lightModeMapStyle = '[{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#969696"},{"saturation":36},{"lightness":40}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#000000"},{"lightness":16},{"visibility":"on"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":17},{"weight":1.2}]},{"featureType":"administrative.country","elementType":"geometry.stroke","stylers":[{"color":"#606060"}]},{"featureType":"administrative.locality","elementType":"labels.icon","stylers":[{"color":"#9e9e9e"},{"visibility":"simplified"}]},{"featureType":"administrative.locality","elementType":"labels.text.fill","stylers":[{"color":"#8d8d8d"}]},{"featureType":"administrative.province","elementType":"geometry.stroke","stylers":[{"color":"#525252"}]},{"featureType":"landscape","stylers":[{"visibility":"on"}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"landscape","elementType":"geometry.stroke","stylers":[{"color":"#636363"}]},{"featureType":"landscape","elementType":"labels.icon","stylers":[{"saturation":"-100"},{"lightness":"-54"}]},{"featureType":"poi","stylers":[{"saturation":"-100"},{"lightness":"0"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#101010"},{"lightness":21}]},{"featureType":"poi","elementType":"labels.icon","stylers":[{"saturation":"-89"},{"lightness":"-55"}]},{"featureType":"poi","elementType":"labels.text","stylers":[{"visibility":"off"}]},{"featureType":"poi.business","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":18}]},{"featureType":"road.arterial","elementType":"geometry.stroke","stylers":[{"color":"#453838"},{"visibility":"off"}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#303030"},{"saturation":"-100"},{"lightness":17}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":29},{"weight":0.2}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":16}]},{"featureType":"road.local","elementType":"geometry.stroke","stylers":[{"visibility":"off"}]},{"featureType":"transit","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":19}]},{"featureType":"transit.station","elementType":"labels.icon","stylers":[{"saturation":"-100"},{"lightness":"-51"},{"visibility":"on"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":17}]}]';
  static const String darkModeMapStyle = '[{"elementType":"geometry","stylers":[{"color":"#f5f5f5"}]},{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#616161"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#f5f5f5"}]},{"featureType":"administrative","elementType":"geometry","stylers":[{"visibility":"off"}]},{"featureType":"administrative.land_parcel","elementType":"labels.text.fill","stylers":[{"color":"#bdbdbd"}]},{"featureType":"poi","stylers":[{"visibility":"off"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#eeeeee"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#757575"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#e5e5e5"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#9e9e9e"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#ffffff"}]},{"featureType":"road","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"road.arterial","elementType":"labels.text.fill","stylers":[{"color":"#757575"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#dadada"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#616161"}]},{"featureType":"road.local","elementType":"labels.text.fill","stylers":[{"color":"#9e9e9e"}]},{"featureType":"transit","stylers":[{"visibility":"off"}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#e5e5e5"}]},{"featureType":"transit.station","elementType":"geometry","stylers":[{"color":"#eeeeee"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#c9c9c9"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#9e9e9e"}]}]';
  static const double defaultZoomMap = 16;

  // Separators
  static const String firstIconTextSeparator = '@';
  static const String secondIconTextSeparator = '#';

  // Images
  static const String connectionLostImage = "images/connection_lost.png";
  static const String errorPageImage = "images/error_page.png";
  static const String appIconImage = "images/app_icon.png";

  // Slider
  static int radiusSliderDivisions = 10;
}
