// ================= Favorites Controller =================
import 'package:get/get.dart';
import 'dart:convert';
import 'package:wiki_places/controllers/preferences_controller.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/widgets/place/place_model.dart';

class FavoritesController {
  static final FavoritesController instance = FavoritesController._();
  FavoritesController._();

  static final StoreController _storeController = Get.put(StoreController());

  List<String> get _placesToJson {
    List<String> favoritePlacesJson = [];
    for (PlaceModel place in _storeController.favoritePlacesCollection.value.places) {
      favoritePlacesJson.add(json.encode(place));
    }
    return favoritePlacesJson;
  }

  List<PlaceModel> _jsonToPlaces(List<String> favoritePlacesJson) {
    List<PlaceModel> favoritePlaces = [];
    for (String place in favoritePlacesJson) {
      favoritePlaces.add(PlaceModel.fromJson(json.decode(place)));
    }
    return favoritePlaces;
  }

  void getFavoritePlaces() async {
    List<String>? favoritePlacesJson = await PreferencesController.instance.getFavoritePlaces;
    if (favoritePlacesJson != null) {
      _storeController.updateFavoritePlacesCollection(_jsonToPlaces(favoritePlacesJson));
    }
  }

  void addPlaceToFavorites(PlaceModel favoritePlace) async {
    await _storeController.addFavoritePlacesCollection(favoritePlace);
    PreferencesController.instance.setFavoritePlaces(_placesToJson);
  }

  void removePlaceFromFavorites(PlaceModel favoritePlace) async {
    await _storeController.removeFavoritePlacesCollection(favoritePlace);
    PreferencesController.instance.setFavoritePlaces(_placesToJson);
  }

  bool checkIfFavorite(PlaceModel place) {
    for (PlaceModel favoritePlace in _storeController.favoritePlacesCollection.value.places) {
      if (place == favoritePlace) {
        return true;
      }
    }
    return false;
  }
}
