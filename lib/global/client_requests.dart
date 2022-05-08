// ================= Client Requests =================
import 'package:get/get.dart';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:wiki_places/metrics/google_analytics.dart';
import 'package:wiki_places/pages/image_page/error_page.dart';
import 'package:wiki_places/global/config.dart';
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
      moveToError ? navigateWithNoBack(const ErrorPage()) : displaySnackbar(content: 'strTryAgain'.tr);
      GoogleAnalytics.instance.logResponseError();
    }

    await performanceTrace.stop();
    return placeJson;
  }

  Future<LatLng?> getPlaceCoordinates({String place = ''}) async {
    Trace performanceTrace = _performance.newTrace("GetPlaceCoordinates");
    Response response = await get('https://nominatim.openstreetmap.org/search?q=${place.replaceAll(" ", "+")}&format=json&polygon=1&addressdetails=1');
    LatLng? placeLatLng;

    if (_isResponseSuccess(response) && response.body.length != 0 && response.body[0].keys.contains("lat") && response.body[0].keys.contains("lon")) {
      placeLatLng = LatLng(double.parse(response.body[0]["lat"]), double.parse(response.body[0]["lon"]));
    }

    await performanceTrace.stop();
    return placeLatLng;
  }
}
