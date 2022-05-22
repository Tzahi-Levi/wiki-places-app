// ================= Global Types =================
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sorted_list/sorted_list.dart';
import 'package:wiki_places/global/utils.dart';

enum EAppPages {places, map, favorites}

enum EPlaceMode {current, other}

typedef Json = Map<String, dynamic>;

class PlaceDetails {
  final String name;
  final LatLng? coordinates;

  PlaceDetails({required this.name, required this.coordinates});
}

class Suggestion extends PlaceDetails {
  String? icon;

  static int compareSuggestion(Suggestion a, Suggestion b) {
    if (a.name.isLocale && !b.name.isLocale) {
      return -1;

    } else if (!a.name.isLocale && b.name.isLocale) {
      return 1;
    }
    return a.name.compareStrings(b.name);
  }

  Suggestion({required String name, required LatLng coordinates, required this.icon}) : super(name: name, coordinates: coordinates);
}

SortedList<Suggestion> get getSuggestionsList => SortedList<Suggestion>(Suggestion.compareSuggestion);

class PrimitiveWrapper {
  var value;

  PrimitiveWrapper(this.value);
}
