// ================= Location Controller =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/global/types.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/metrics/google_analytics.dart';

class LocationController {
  static final LocationController _instance = LocationController._();
  static LocationController get instance => _instance;
  LocationController._();

  static final _storeController = Get.put(StoreController());

  static Future<Json?> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {

      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        _storeController.changeMainAppPage(AppPages.places);
        displayAlertDialog(title: 'strError'.tr, content: Text('strLocationPermissionDenied'.tr));
        GoogleAnalytics.instance.logPermissionDenied();
        return null;
      }
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return {"lat": position.latitude, "lon": position.longitude};
  }
}
