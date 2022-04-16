// ================= Places Page Model =================
import 'package:sorted_list/sorted_list.dart';
import 'package:wiki_places/widgets/place/place_model.dart';

class PlacesPageCollection {
  late SortedList<PlaceModel> places;

  void _initList() {
    places = SortedList<PlaceModel>((a, b) => a.compareTo(b));
  }

  PlacesPageCollection() {
    _initList();
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
