// ================= Preferences Controller =================
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesController {
  static final PreferencesController _instance = PreferencesController._();
  static PreferencesController get instance => _instance;
  PreferencesController._();

  final String _favoritePlacesKey = "favoritePlaces";

  Future<List<String>?> get getFavoritePlaces async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(_favoritePlacesKey);
  }

  void setFavoritePlaces(List<String> favoritePlaces) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList(_favoritePlacesKey, favoritePlaces);
  }
}
