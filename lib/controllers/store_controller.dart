// ================= Store Controller =================
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wiki_places/metrics/google_analytics.dart';
import 'package:wiki_places/pages/places/places_page_collection.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/global/client_requests.dart';
import 'package:wiki_places/controllers/location_controller.dart';
import 'package:wiki_places/global/constants.dart';

class StoreController extends GetxController {
  // State
  final Rx<AppPages> currentMainAppPage = AppPages.places.obs;
  final RxString radius = '1'.obs;
  late Rx<PlacesPageCollection> placesCollection = PlacesPageCollection().obs;
  RxBool isLoading = false.obs;
  Rx<LatLng> currentPlace = LatLng(GlobalConstants.defaultInitialMapLocation["lat"], GlobalConstants.defaultInitialMapLocation["lon"]).obs;
  RxBool isCurrentPlace = true.obs;

  // Actions
  void changeMainAppPage(AppPages page ) {
    currentMainAppPage.value = page;
    update();
  }

  void changeRadius(String newRadius) {
    radius.value = newRadius;
    update();
    GoogleAnalytics.instance.logRadiusChanged();
  }

  void updateIsLoading(bool value) {
    isLoading.value = value;
    update();
  }

  void updateCurrentPlace([LatLng? newCurrentPlace]) async {
    if (newCurrentPlace == null) {
      Json? currentLocation = await LocationController.getLocation();
      if (currentLocation == null) {  // no permission
        updateIsLoading(false);
        return;
      }

      newCurrentPlace = LatLng(currentLocation["lat"], currentLocation["lon"]);
      isCurrentPlace.value = true;

    } else {
      isCurrentPlace.value = false;
    }

    currentPlace.value = newCurrentPlace;
    update();
    GoogleAnalytics.instance.logCurrentPlaceUpdated();
  }

  void searchPlaces({bool showToast = false, bool moveToError = false, bool reportToGA = true}) async {
    List<dynamic>? placeJson = await ClientRequests.instance.getPlacesData(radius: radius.value, lat: currentPlace.value.latitude, lon: currentPlace.value.longitude, moveToError: moveToError);
    if (placeJson == null) {
      return;
    }

    placesCollection.value = PlacesPageCollection.fromJson(placeJson);
    update();
    updateIsLoading(false);

    if (showToast) {
      displaySnackbar(
          content: 'strSearchSuccessfully'.trParams({  // TODO- add current place
            'radius': radius.value,
            'scale': GlobalConstants.defaultScale,
          }));
    }

    if (reportToGA) {
      GoogleAnalytics.instance.logSearchPlaces();
    }
  }
}
