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
    return [{"label": "אובליסק הטכניון", "pin": {"location": {"lat": 32.77706944, "lon": 35.02298889}, "distance[km]": 0.1327594374395938}, "url": "https://he.wikipedia.org/wiki/אובליסק_הטכניון", "abstract": "}}"}, {"label": "אצטדיון האתלטיקה ע\"ש קרלי קריגר", "pin": {"location": {"lat": 32.78236111, "lon": 35.02144444}, "distance[km]": 0.5395016302109408}, "url": "https://he.wikipedia.org/wiki/אצטדיון_האתלטיקה_ע\"ש_קרלי_קריגר", "abstract": "נווה שאנן, חיפה, ישראל"}, {"label": "הטכניון - מכון טכנולוגי לישראל", "pin": {"location": {"lat": 32.7775, "lon": 35.02166667}, "distance[km]": 0.0}, "url": "https://he.wikipedia.org/wiki/הטכניון_-_מכון_טכנולוגי_לישראל", "abstract": "| סטודנטים לתואר שני ="}, {"label": "המכון הישראלי לחקר הנדסה ימית", "pin": {"location": {"lat": 32.77982327, "lon": 35.02298067}, "distance[km]": 0.28555014532417566}, "url": "https://he.wikipedia.org/wiki/המכון_הישראלי_לחקר_הנדסה_ימית", "abstract": "| סמל ="}, {"label": "המכון לננוטכנולוגיה על שם ראסל ברי", "pin": {"location": {"lat": 32.77768005, "lon": 35.0215799}, "distance[km]": 0.021559005193793352}, "url": "https://he.wikipedia.org/wiki/המכון_לננוטכנולוגיה_על_שם_ראסל_ברי", "abstract": "}}"}, {"label": "הספרייה המרכזית ע\"ש אלישר", "pin": {"location": {"lat": 32.77579, "lon": 35.0225}, "distance[km]": 0.2050820837233389}, "url": "https://he.wikipedia.org/wiki/הספרייה_המרכזית_ע\"ש_אלישר", "abstract": "הספרייה המרכזית ע\"ש אלישר היא הגוף המרכזי במערך ספריות הטכניון ולה תפקיד דואלי: לספק תשתית לפעילות המקצועית עבור כלל ספריות הטכניון ולספק שירותי קהל מגוונים למשתמשיה השונים. הספרייה המרכזית מהווה את הסמכות המקצועית הקובעת מדיניות, נהלים והנחיות עבודה לכלל הספריות בטכניון."}, {"label": "הפקולטה לארכיטקטורה ובינוי ערים (הטכניון)", "pin": {"location": {"lat": 32.77811111, "lon": 35.02308333}, "distance[km]": 0.14902450369057763}, "url": "https://he.wikipedia.org/wiki/הפקולטה_לארכיטקטורה_ובינוי_ערים_(הטכניון)", "abstract": "|סוג=פקולטה"}, {"label": "הפקולטה להנדסה כימית (הטכניון)", "pin": {"location": {"lat": 32.77805556, "lon": 35.02702778}, "distance[km]": 0.5060299478204925}, "url": "https://he.wikipedia.org/wiki/הפקולטה_להנדסה_כימית_(הטכניון)", "abstract": "|סוג=פקולטה"}, {"label": "הפקולטה להנדסת אווירונאוטיקה וחלל", "pin": {"location": {"lat": 32.77433333, "lon": 35.02163889}, "distance[km]": 0.3511948587504922}, "url": "https://he.wikipedia.org/wiki/הפקולטה_להנדסת_אווירונאוטיקה_וחלל", "abstract": "|סוג=פקולטה"}, {"label": "הפקולטה להנדסת ביוטכנולוגיה ומזון", "pin": {"location": {"lat": 32.777727, "lon": 35.027137}, "distance[km]": 0.513116487748794}, "url": "https://he.wikipedia.org/wiki/הפקולטה_להנדסת_ביוטכנולוגיה_ומזון", "abstract": "|סוג=פקולטה"}, {"label": "הפקולטה להנדסת חשמל (הטכניון)", "pin": {"location": {"lat": 32.77594444, "lon": 35.02508333}, "distance[km]": 0.36362661213110375}, "url": "https://he.wikipedia.org/wiki/הפקולטה_להנדסת_חשמל_(הטכניון)", "abstract": "| סוג = פקולטה"}, {"label": "הפקולטה להנדסת תעשייה וניהול (הטכניון)", "pin": {"location": {"lat": 32.77422222, "lon": 35.02377778}, "distance[km]": 0.41383261991901815}, "url": "https://he.wikipedia.org/wiki/הפקולטה_להנדסת_תעשייה_וניהול_(הטכניון)", "abstract": "|סוג=פקולטה"}, {"label": "הפקולטה לכימיה (הטכניון)", "pin": {"location": {"lat": 32.77761111, "lon": 35.02586111}, "distance[km]": 0.39315771431898017}, "url": "https://he.wikipedia.org/wiki/הפקולטה_לכימיה_(הטכניון)", "abstract": "|סוג=פקולטה"}, {"label": "הפקולטה למדעי המחשב (הטכניון)", "pin": {"location": {"lat": 32.77794693, "lon": 35.02159401}, "distance[km]": 0.05003004132229874}, "url": "https://he.wikipedia.org/wiki/הפקולטה_למדעי_המחשב_(הטכניון)", "abstract": "}}"}, {"label": "מוסד שמואל נאמן למחקר מדיניות לאומית", "pin": {"location": {"lat": 32.77834301, "lon": 35.02087249}, "distance[km]": 0.11948383955550967}, "url": "https://he.wikipedia.org/wiki/מוסד_שמואל_נאמן_למחקר_מדיניות_לאומית", "abstract": "}}"}, {"label": "מכון אשר לחקר החלל", "pin": {"location": {"lat": 32.77382, "lon": 35.02051}, "distance[km]": 0.4222561869261558}, "url": "https://he.wikipedia.org/wiki/מכון_אשר_לחקר_החלל", "abstract": "שמאל|ממוזער|250px|חזית מבנה מכון אשר לחקר החלל"}, {"label": "מכון המתכות הישראלי", "pin": {"location": {"lat": 32.77533165, "lon": 35.02536434}, "distance[km]": 0.4217093241476695}, "url": "https://he.wikipedia.org/wiki/מכון_המתכות_הישראלי", "abstract": "}}"}];
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
