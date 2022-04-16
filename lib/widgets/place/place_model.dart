// ================= Place Model =================
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/global/utils.dart';

class PlaceModel {
  late String label;
  late String abstract;
  late String url;
  late double distance;
  late double lat;
  late double lon;

  String _filterAbstract(String? abstract) {
    if (abstract == null) {
      return "";
    }
    return abstract.replaceAll("_", " ").replaceAll("{", "").replaceAll("}", "").replaceAll("=", " ").replaceAll("|", "").replaceAll(RegExp(r'[0-9]+[p][x]'), " ").replaceAll("  ", " ");
  }

  PlaceModel.fromJson(Json placeJson) {
    label = placeJson["label"];
    abstract = _filterAbstract(placeJson["abstract"]);
    url = placeJson["url"];
    distance = placeJson["pin"]["distance[km]"].toDouble();
    lat = placeJson["pin"]["location"]["lat"].toDouble();
    lon = placeJson["pin"]["location"]["lon"].toDouble();
  }

  int _comparePerDistance(PlaceModel other) {
    if (distance == other.distance) {
      return 0;
    }
    return (distance > other.distance) ? 1 : -1;
  }

  int compareTo(PlaceModel other){
    int comparePerDistance = _comparePerDistance(other);
    return (comparePerDistance == 0) ? label.compareStrings(other.label) : comparePerDistance;
  }
}
