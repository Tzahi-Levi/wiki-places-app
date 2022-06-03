// ================= Store Controller =================
import 'package:get/get.dart';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sorted_list/sorted_list.dart';
import 'package:wiki_places/metrics/google_analytics.dart';
import 'package:wiki_places/pages/places/places_page_collection.dart';
import 'package:wiki_places/widgets/place/place_model.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/global/client_requests.dart';
import 'package:wiki_places/controllers/location_controller.dart';
import 'package:wiki_places/global/constants.dart';

class StoreController extends GetxController {
  // State
  final Rx<EAppPages> currentMainAppPage = EAppPages.splash.obs;
  final RxString radius = GlobalConstants.defaultRadius.obs;
  final Rx<PlacesPageCollection> placesCollection = PlacesPageCollection().obs;
  final Rx<PlacesPageCollection> favoritePlacesCollection = PlacesPageCollection().obs;
  final RxBool globalIsLoading = true.obs;
  final Rx<LatLng> placeCoordinates = LatLng(GlobalConstants.defaultInitialMapLocation["lat"], GlobalConstants.defaultInitialMapLocation["lon"]).obs;
  final Rx<String> placeName = "".obs;
  final Rx<EPlaceMode> placeMode = EPlaceMode.current.obs;
  final Rx<SortedList<String>> placeFilters = SortedList<String>().obs;

  bool _editFilter = false;

  // Actions
  void setStore(Json store) {
    radius.value = store['radius'];
    placeCoordinates.value = store['placeCoordinates'];
    placeName.value = store['placeName'];
    placeMode.value = store['placeMode'];
    placeFilters.value = SortedList<String>();
    placeFilters.value.addAll(store['filters']);
    update();
  }

  void updateGlobalIsLoading(bool value) {
    globalIsLoading.value = value;
    update();
  }

  void updateMainAppPage(EAppPages page) {
    currentMainAppPage.value = page;
    update();
  }

  Future<bool> addPlaceFilter(String filter) async {
    if (_editFilter) {
      return false;
    }
    _editFilter = true;

    if (!placeFilters.value.contains(filter)) {
      SortedList<String> newFiltersList = SortedList<String>();
      newFiltersList.addAll(placeFilters.value);
      newFiltersList.add(filter);
      if (!await updatePlacesCollection(filtersList: newFiltersList, reportToGA: false)) {
        _editFilter = false;
        return false;
      }

      placeFilters.value.add(filter);
      placeFilters.refresh();
      GoogleAnalytics.instance.logFilterAdded();
    }

    _editFilter = false;
    return true;
  }

  Future<bool> removePlaceFilter(String filter) async {
    if (_editFilter) {
      return false;
    }
    _editFilter = true;

    if (placeFilters.value.contains(filter)) {
      SortedList<String> newFiltersList = SortedList<String>();
      newFiltersList.addAll(placeFilters.value);
      newFiltersList.remove(filter);
      if (!await updatePlacesCollection(filtersList: newFiltersList, reportToGA: false)) {
        _editFilter = false;
        return false;
      }

      placeFilters.value.remove(filter);
      placeFilters.refresh();
      GoogleAnalytics.instance.logFilterRemoved();
    }
    _editFilter = false;
    return true;
  }

  Future<bool> cleanAllFilters({bool checkBeforeCleaning = true, bool reportToGA = true}) async {
    if (_editFilter) {
      return false;
    }
    _editFilter = true;

    if (checkBeforeCleaning) {
      SortedList<String> newFiltersList = SortedList<String>();
      newFiltersList.addAll(placeFilters.value);
      newFiltersList.removeRange(0, newFiltersList.length);
      if (!await updatePlacesCollection(filtersList: newFiltersList, reportToGA: false)) {
        _editFilter = false;
        return false;
      }
    }

    placeFilters.value.removeRange(0, placeFilters.value.length);
    placeFilters.refresh();

    if (reportToGA) {
      GoogleAnalytics.instance.logFilterRemoved();
    }

    _editFilter = false;
    return true;
  }

  void updateRadius(String newRadius) {
    radius.value = newRadius;
    update();
    GoogleAnalytics.instance.logRadiusChanged();
  }

  Future<void> updatePlaceToCurrentMode() async {
    Json? currentLocation = await LocationController.getLocation();
    if (currentLocation == null) {  // no permission
      return;
    }

    LatLng currentPlace = LatLng(currentLocation["lat"], currentLocation["lon"]);
    PlaceDetails? placeDetails = await ClientRequests.instance.getPlaceDetailsByCoordinates(coordinates: currentPlace);

    placeCoordinates.value = currentPlace;
    placeName.value = (placeDetails != null) ? "" : placeDetails!.name;
    placeMode.value = EPlaceMode.current;
    update();
    GoogleAnalytics.instance.logCurrentPlaceMode();
  }

  Future<bool> updatePlaceToOtherMode({required String otherPlace}) async {
    PlaceDetails placeDetails = await ClientRequests.instance.getPlaceDetailsByPartiallyName(place: otherPlace);
    if (placeDetails.coordinates != null) {
      placeCoordinates.value = placeDetails.coordinates!;
      placeName.value = placeDetails.name;
      placeMode.value = EPlaceMode.other;
      update();
      GoogleAnalytics.instance.logOtherPlaceMode();
      return true;
    }
    return false;
  }

  Future<bool> updatePlaceToSpecificLocation({required LatLng newPlaceCoordinates}) async {
    PlaceDetails? placeDetails = await ClientRequests.instance.getPlaceDetailsByCoordinates(coordinates: newPlaceCoordinates);
    if (placeDetails == null) {
      GoogleAnalytics.instance.logError("getPlaceDetailsByCoordinates failed");
      return true;
    }

    placeCoordinates.value = newPlaceCoordinates;
    placeName.value = placeDetails.name;
    placeMode.value = EPlaceMode.other;
    update();
    GoogleAnalytics.instance.logOtherPlaceMode();
    return true;
  }

  Future<bool> updatePlacesCollection({SortedList<String>? filtersList, bool moveToError = false, bool reportToGA = true}) async {
    filtersList ??= placeFilters.value;
    List<dynamic>? placeJson = await ClientRequests.instance.getPlacesData(radius: radius.value, lat: placeCoordinates.value.latitude, lon: placeCoordinates.value.longitude, moveToError: moveToError);
    if (placeJson == null) {
      return false;
    }

    placesCollection.value = PlacesPageCollection.fromJson(placeJson, filtersList);
    update();

    if (reportToGA) {
      GoogleAnalytics.instance.logPlacesCollection();
    }
    return true;
  }

  void updateFavoritePlacesCollection(List<PlaceModel> favoritePlaces) {
    favoritePlacesCollection.value = PlacesPageCollection.fromList(favoritePlaces);
    favoritePlacesCollection.refresh();
  }

  Future<void> addFavoritePlacesCollection(PlaceModel favoritePlace) async {
    favoritePlacesCollection.value.places.add(PlaceModel.fromJson(json.decode(json.encode(favoritePlace))));
    favoritePlacesCollection.refresh();
    GoogleAnalytics.instance.logAddFavorite();
  }

  Future<void> removeFavoritePlacesCollection(PlaceModel favoritePlace) async {
    favoritePlacesCollection.value.places.remove(favoritePlace);
    favoritePlacesCollection.refresh();
    GoogleAnalytics.instance.logRemoveFavorite();
  }
}
