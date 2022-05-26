// ================= Places Page Model =================
import 'package:sorted_list/sorted_list.dart';
import 'package:wiki_places/widgets/place/place_model.dart';
import 'package:wiki_places/global/utils.dart';

class PlacesPageCollection {
  late SortedList<PlaceModel> places;

  void _initList() {
    places = SortedList<PlaceModel>((a, b) => a.compareTo(b));
  }

  PlacesPageCollection() {
    _initList();
  }

  PlacesPageCollection.fromList(List<PlaceModel> placeList) {
    _initList();
    places.addAll(placeList);
  }

  PlacesPageCollection.fromJson(List placesJson, SortedList<String> placeFilters) {
    _initList();
    for (var json in placesJson) {
      PlaceModel newPlace = PlaceModel.fromJson(json);
      if (placeFilters.isEmpty || _doesContainFilter(newPlace, placeFilters)) {
        places.add(newPlace);
      }
    }
  }

  bool get isEmpty => places.isEmpty;
  int get length => places.length;

  bool _doesContainFilter(PlaceModel place, SortedList<String> placeFilters) {
    for (var filter in placeFilters) {
      if (place.label.contains(filter) || place.abstract.contains(filter)) {
        return true;
      }
    }
    return false;
  }
}
