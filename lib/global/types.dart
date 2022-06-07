// ================= Global Types =================
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sorted_list/sorted_list.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/widgets/place/place_model.dart';

enum EAppPages {favorites, places, map, settings, splash}

enum EPlaceMode {current, other}

typedef Json = Map<String, dynamic>;

bool isDialogOpen = false;

class PlaceDetails {
  final String name;
  final LatLng? coordinates;

  PlaceDetails({required this.name, required this.coordinates});
}

class Suggestion extends PlaceDetails {
  String icon;

  static int compareSuggestion(Suggestion a, Suggestion b) => a.name.compareStrings(b.name);
  Suggestion({required String name, required LatLng coordinates, required this.icon}) : super(name: name, coordinates: coordinates);
}

SortedList<Suggestion> get getSuggestionsList => SortedList<Suggestion>(Suggestion.compareSuggestion);

SortedList<PlaceModel> get getPlacesList => SortedList<PlaceModel>((a, b) => a.compareTo(b));

typedef FiltersList = SortedList<String>;

class PrimitiveWrapper {
  var value;

  PrimitiveWrapper(this.value);
}
