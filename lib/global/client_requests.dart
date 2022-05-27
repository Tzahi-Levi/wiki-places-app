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
import 'package:wiki_places/localization/resources/resources_en.dart';

class ClientRequests extends GetConnect {
  static final ClientRequests instance = ClientRequests._();
  ClientRequests._();

  bool _isResponseSuccess(Response response) {
    return response.statusCode == 200;
  }

  Future<List<dynamic>?> getPlacesData({required String radius, required double lat, required double lon, bool moveToError = false}) async {
    Response response = await get('http://${ProjectConfig.serverAddress}''/wiki_by_place?radius=$radius${resourcesEn['strKm']!.toLowerCase()}&lat,lon=${lat.toString()},${lon.toString()}');
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
    Response response = await get('https://nominatim.openstreetmap.org/search?q=${place.replaceAll(" ", "+")}&format=json&polygon=1&addressdetails=1');
    LatLng? coordinates;
    String placeName = "";

    if (_isResponseSuccess(response) && response.body.length != 0 && response.body[0].keys.contains("lat") && response.body[0].keys.contains("lon") && response.body[0].keys.contains("display_name") && response.body[0]["display_name"].contains(place)) {
      placeName = fullAddressToDisplayedAddress(response.body[0]["display_name"]);
      coordinates = LatLng(double.parse(response.body[0]["lat"]), double.parse(response.body[0]["lon"]));
    }

    return PlaceDetails(name: placeName, coordinates: coordinates);
  }

  Future<PlaceDetails?> getPlaceDetailsByCoordinates({required LatLng coordinates}) async {
    Response response = await get('http://nominatim.openstreetmap.org/reverse?format=json&lat=${coordinates.latitude}&lon=${coordinates.longitude}&zoom=18&addressdetails=1');
    String placeName = "";

    if (_isResponseSuccess(response) && response.body["display_name"] != null) {
      placeName = fullAddressToDisplayedAddress(response.body["display_name"]);
    }

    return PlaceDetails(name: placeName, coordinates: coordinates);
  }

  Future<SortedList<Suggestion>> getSuggestions({required String pattern}) async {
    pattern = pattern.replaceAll("רחוב ", "").replaceAll("שדרה ", "").replaceAll("מספר ", "").replaceAll(RegExp("\\d"), "").replaceAll(" ", "+");
    if (pattern.isNotEmpty && pattern.lastIndexOf("+") == pattern.length -1) {
      pattern = pattern.substring(0, pattern.length - 1);
    }

    Response response = await get('https://nominatim.openstreetmap.org/search?q=$pattern&format=json&polygon=1&addressdetails=1');
    SortedList<Suggestion> suggestions = getSuggestionsList;

    if (_isResponseSuccess(response)) {
      for (int placeIndex = 0; placeIndex < response.body.length; placeIndex++) {
        Suggestion newSuggestion = Suggestion(
            name: fullAddressToDisplayedAddress(response.body[placeIndex]["display_name"]),
            coordinates: LatLng(double.parse(response.body[placeIndex]["lat"]), double.parse(response.body[placeIndex]["lon"])),
            icon: response.body[placeIndex]["icon"]
        );

        bool isAlreadyExist = suggestions.where((Suggestion suggestion) => suggestion.name == newSuggestion.name).toList().isNotEmpty;
        if (!isAlreadyExist && newSuggestion.name.contains(pattern)) {
          suggestions.add(newSuggestion);
        }
      }
    }

    return suggestions;
  }
}
