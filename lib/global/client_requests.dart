// ================= Client Requests =================
import 'package:get/get.dart';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sorted_list/sorted_list.dart';
import 'package:wiki_places/metrics/google_analytics.dart';
import 'package:wiki_places/pages/image_page/error_page.dart';
import 'package:wiki_places/global/config.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/global/utils.dart';

class ClientRequests extends GetConnect {
  static final ClientRequests instance = ClientRequests._();
  ClientRequests._();

  bool _isResponseSuccess(Response response) {
    return response.statusCode == 200;
  }

  Future<List<dynamic>?> getPlacesData({required String radius, required double lat, required double lon, bool moveToError = false}) async {
    Response response = await get('http://${ProjectConfig.serverAddress}''/wiki_by_place?radius=${radius}km&lat,lon=${lat.toString()},${lon.toString()}');
    List<dynamic>? placeJson;

    if (_isResponseSuccess(response)) {
      placeJson = json.decode(response.body);
    } else {
      moveToError ? navigateWithNoBack(const ErrorPage()) : displaySnackbar(content: 'strTryAgain'.tr);
      GoogleAnalytics.instance.logError("getPlacesData did not succeeded");
    }

    return placeJson;
  }

  Future<PlaceDetails> getPlaceDetailsByPartiallyName({required String place}) async {
    Response response = await get('http://${ProjectConfig.serverAddress}/place_details_by_name?name=$place');
    LatLng? coordinates;
    String placeName = "";

    if (_isResponseSuccess(response)) {
      Map responseBody = json.decode(response.body);
      placeName = responseBody["name"];
      coordinates = LatLng(responseBody["lat"], responseBody["lon"]);
    }

    return PlaceDetails(name: placeName, coordinates: coordinates);
  }

  Future<PlaceDetails?> getPlaceDetailsByCoordinates({required LatLng coordinates}) async {
    Response response = await get('http://${ProjectConfig.serverAddress}/place_details_by_coordinates?lat=${coordinates.latitude}&lon=${coordinates.longitude}');
    String placeName = _isResponseSuccess(response) ? json.decode(response.body)["name"] : "";
    return PlaceDetails(name: placeName, coordinates: coordinates);
  }

  Future<SortedList<Suggestion>> getSuggestions({required String pattern}) async {
    Response response = await get('http://${ProjectConfig.serverAddress}/get_suggestions?name=$pattern');
    SortedList<Suggestion> suggestions = getSuggestionsList;

    if (_isResponseSuccess(response)) {
      for (var suggestion in json.decode(response.body)["suggestions"]) {
        suggestions.add(Suggestion(
            name: suggestion["name"],
            coordinates: LatLng(suggestion["lat"], suggestion["lon"]),
            icon: suggestion["icon"]
        ));
      }
    }

    return suggestions;
  }
}
