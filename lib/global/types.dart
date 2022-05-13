// ================= Global Types =================
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum EAppPages {places, map}

enum EPlaceMode {current, other}

typedef Json = Map<String, dynamic>;

class PlaceDetails {
  String? name;
  LatLng? coordinates;

  PlaceDetails({this.name, this.coordinates});
}

class PrimitiveWrapper {
  var value;

  PrimitiveWrapper(this.value);
}
