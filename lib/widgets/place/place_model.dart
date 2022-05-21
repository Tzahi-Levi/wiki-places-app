// ================= Place Model =================
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/controllers/location_controller.dart';

class PlaceModel {
  late String label;
  late String abstract;
  late String url;
  late double distance;
  late double lat;
  late double lon;
  late String imageUrl;

  PlaceModel.fromJson(Json placeJson) {
    label = placeJson["label"];
    abstract = placeJson["abstract"];
    url = placeJson["url"];
    lat = placeJson["pin"]["location"]["lat"].toDouble();
    lon = placeJson["pin"]["location"]["lon"].toDouble();
    imageUrl = placeJson["imageUrl"];
    distance = placeJson["pin"]["distance[km]"] == null ? _calculateDistance() : placeJson["pin"]["distance[km]"].toDouble();
  }

  Json toJson() => {
    "label": label,
    "abstract": abstract,
    "url": url,
    "imageUrl": imageUrl,
    "pin" : {
      "location": {
        "lat": lat,
        "lon": lon,
        "distance[km]": null
      }
    }
  };

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

  Future<double> _calculateDistance() async {
    double? distance = await LocationController.calculateDistance(startLatitude: lat, startLongitude: lon);
    return distance ?? -1;
  }
}
