// ================= Places Page Model =================
import 'package:sorted_list/sorted_list.dart';
import 'package:wiki_places/widgets/place/place_model.dart';
import 'package:wiki_places/global/types.dart';

class PlacesPageCollection {
  late SortedList<PlaceModel> places;

  void _initList() {
    places = getPlacesList;
  }

  PlacesPageCollection() {
    _initList();
  }

  PlacesPageCollection.fromList(List<PlaceModel> placeList) {
    _initList();
    places.addAll(placeList);
  }

  PlacesPageCollection.fromJson(List placesJson) {
    _initList();
    for (var json in placesJson) {
      places.add(PlaceModel.fromJson(json));
    }
  }

  bool get isEmpty => places.isEmpty;
  int get length => places.length;
}
