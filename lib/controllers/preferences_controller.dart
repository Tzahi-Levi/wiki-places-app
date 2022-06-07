// ================= Preferences Controller =================
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesController {
  static final PreferencesController instance = PreferencesController._();
  PreferencesController._();

  final String _favoritePlacesKey = "favoritePlaces";
  final String _searchPlaceMessageKey = "searchPlaceMessageSeen";
  final String _walkthroughKey = "walkthroughSeen";

  Future<List<String>?> get getFavoritePlaces async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(_favoritePlacesKey);
  }

  void setFavoritePlaces(List<String> favoritePlaces) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList(_favoritePlacesKey, favoritePlaces);
  }

  Future<bool> get wasSearchPlaceMessageSeen async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_searchPlaceMessageKey) != null;
  }

  void setSearchPlaceMessageSeen() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(_searchPlaceMessageKey, true);
  }

  Future<bool> get wasWalkthroughSeen async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_walkthroughKey) != null;
  }

  void setWalkthroughSeen() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(_walkthroughKey, true);
  }
}
