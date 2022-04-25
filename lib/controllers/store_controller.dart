// ================= Store Controller =================
import 'package:get/get.dart';
import 'dart:convert';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:wiki_places/metrics/google_analytics.dart';
import 'package:wiki_places/pages/places/places_page_collection.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/global/client_requests.dart';
import 'package:wiki_places/controllers/location_controller.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/pages/image_page/error_page.dart';

class StoreController extends GetxController {
  final FirebasePerformance _performance = FirebasePerformance.instance;

  // State
  final Rx<AppPages> currentMainAppPage = AppPages.places.obs;
  final RxString radius = '1'.obs;
  late Rx<PlacesPageCollection> placesCollection = PlacesPageCollection().obs;
  RxBool isLoading = false.obs;

  // Actions
  void changeMainAppPage(AppPages page ) {
    currentMainAppPage.value = page;
    update();
  }

  void changeRadius(String newRadius) {
    radius.value = newRadius;
    update();
    searchPlaces();
    GoogleAnalytics.instance.logRadiusChanged();
  }

  void updateIsLoading(bool value) {
    isLoading.value = value;
    update();
  }

  Future<void> searchPlaces() async {
    Trace performanceTrace = _performance.newTrace("GetPlacesData");

    Json? location = await LocationController.getLocation();
    if (location == null) {  // no permission
      updateIsLoading(false);
      return;
    }

    Response response = await ClientRequests.instance.getPlacesData(radius: radius.value, lat: location["lat"], lon: location["lon"]);

    if (!ClientRequests.instance.isResponseSuccess(response)) {
      navigateWithNoBack(const ErrorPage());
    }

    placesCollection.value = PlacesPageCollection.fromJson(json.decode(response.body));
    update();
    await performanceTrace.stop();
    updateIsLoading(false);

    displaySnackbar(
        content: 'strSearchSuccessfully'.trParams({
          'radius': radius.value,
          'scale': GlobalConstants.defaultScale,
        }));

    await placesCollection.value.loadPlacesImages();
    placesCollection.refresh();
    GoogleAnalytics.instance.logSearchPlaces();
  }
}
