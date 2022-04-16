// ================= Location Controller =================
import 'dart:async';

import 'package:wiki_places/global/types.dart';
import 'package:geolocator/geolocator.dart';

class LocationController {
  static final LocationController _instance = LocationController._();
  static LocationController get instance => _instance;
  LocationController._();

  static Future<Json> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');  // TODO- check on real device
      }
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return {"lat": position.latitude, "lon": position.longitude};
  }
}
