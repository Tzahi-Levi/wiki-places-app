// ================= Places Page Model =================
import 'package:sorted_list/sorted_list.dart';
import 'package:wiki_places/widgets/place/place_model.dart';
import 'package:wiki_places/global/types.dart';

class PlacesPageCollection {
  late SortedList<PlaceModel> places;

  PlacesPageCollection() {
    places = getPlacesList;
  }

  PlacesPageCollection.fromList(List<PlaceModel> placeList) {
    places = getPlacesList;
    places.addAll(placeList);
  }

  PlacesPageCollection.fromJson(List placesJson) {
    places = getPlacesList;
    for (var json in placesJson) {
      places.add(PlaceModel.fromJson(json));
    }
  }

  bool get isEmpty => places.isEmpty;
  int get length => places.length;
}
