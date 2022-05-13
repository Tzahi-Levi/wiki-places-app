// ================= Client Requests =================
import 'package:get/get.dart';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/metrics/google_analytics.dart';
import 'package:wiki_places/pages/image_page/error_page.dart';
import 'package:wiki_places/global/config.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/localization/resources/resources_en.dart';

class ClientRequests extends GetConnect {
  static final ClientRequests _instance = ClientRequests._();
  static ClientRequests get instance => _instance;
  ClientRequests._();

  final FirebasePerformance _performance = FirebasePerformance.instance;

  bool _isResponseSuccess(Response response) {
    return response.statusCode == 200;
  }

  Future<List<dynamic>?> getPlacesData({String radius = '', double lat = 0, double lon = 0, bool moveToError = false}) async {
    Trace performanceTrace = _performance.newTrace("GetPlacesData");
    Response response = await get('http://${ProjectConfig.serverAddress}''/wiki_by_place?radius=$radius${resourcesEn['strKm']!.toLowerCase()}&lat,lon=${lat.toString()},${lon.toString()}');
    List<dynamic>? placeJson;

    if (_isResponseSuccess(response)) {
      placeJson = json.decode(response.body);
    } else {
      print("@@@@@@@@@@@@@@@@@@@@");  // TODO
      print(response.body);
      print("@@@@@@@@@@@@@@@@@@@@");

      moveToError ? navigateWithNoBack(const ErrorPage()) : displaySnackbar(content: 'strTryAgain'.tr);
      GoogleAnalytics.instance.logError("getPlacesData did not succeeded");
    }

    await performanceTrace.stop();
    return placeJson;
  }

  Future<PlaceDetails> getPlaceDetailsByPartiallyName({String place = ''}) async {
    Trace performanceTrace = _performance.newTrace("getPlaceDetailsByPartiallyName");
    Response response = await get('https://nominatim.openstreetmap.org/search?q=${place.replaceAll(" ", "+")}&format=json&polygon=1&addressdetails=1');
    LatLng? coordinates;
    String? placeName;

    if (_isResponseSuccess(response) && response.body.length != 0 && response.body[0].keys.contains("lat") && response.body[0].keys.contains("lon") && response.body[0].keys.contains("display_name")) {
      placeName = fullAddressToDisplayedAddress(response.body[0]["display_name"]);
      coordinates = LatLng(double.parse(response.body[0]["lat"]), double.parse(response.body[0]["lon"]));
    }

    await performanceTrace.stop();
    return PlaceDetails(name: placeName, coordinates: coordinates);
  }

  Future<PlaceDetails?> getPlaceDetailsByCoordinates({LatLng? coordinates}) async {
    if (coordinates == null) {
      GoogleAnalytics.instance.logError("Given Location In getPlaceDetailsByCoordinates Function is null");
      return null;
    }

    Trace performanceTrace = _performance.newTrace("getPlaceDetailsByCoordinates");
    Response response = await get('http://nominatim.openstreetmap.org/reverse?format=json&lat=${coordinates.latitude}&lon=${coordinates.longitude}&zoom=18&addressdetails=1');
    String? placeName;

    if (_isResponseSuccess(response) && response.body["display_name"] != null) {
      placeName = fullAddressToDisplayedAddress(response.body["display_name"]);
    }

    await performanceTrace.stop();
    return PlaceDetails(name: placeName, coordinates: coordinates);
  }
}
