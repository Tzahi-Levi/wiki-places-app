// ================= Client Requests =================
import 'package:get/get.dart';
import 'package:wiki_places/global/config.dart';
import 'package:wiki_places/localization/resources/resources_en.dart';
import 'package:wiki_places/global/types.dart';

class ClientRequests extends GetConnect {
  static final ClientRequests _instance = ClientRequests._();
  static ClientRequests get instance => _instance;
  ClientRequests._();

  bool isResponseSuccess(Response response) {
    return response.statusCode == 200;
  }

  Future<Response> getPlacesData({String radius = '', double lat = 0, double lon = 0}) =>
      get('http://${ProjectConfig.serverAddress}''/wiki_by_place?radius=$radius${resourcesEn['strKm']!.toLowerCase()}&lat,lon=${lat.toString()},${lon.toString()}');

  Future<String?> getPlaceImageUrl({String placeTitle = ""}) async {
    Response response = await get('http://${ProjectConfig.serverLanguage}.wikipedia.org/w/api.php?action=query&titles=${placeTitle.replaceAll(" ", "_")}&prop=images&format=json');

    if (isResponseSuccess(response)) {

      Json imageTokens = Json.from(response.body);
      if (imageTokens.keys.contains("continue") && imageTokens["continue"].keys.contains("imcontinue")) {
        String image = imageTokens["continue"]["imcontinue"];

        response = await get('http://${ProjectConfig.serverLanguage}.wikipedia.org/w/api.php?action=query&titles=File:${image.substring(image.indexOf("|") + 1)}&prop=imageinfo&iiprop=url&format=json');
        if (isResponseSuccess(response)) {
          return Json.from(response.body)["query"]?["pages"]?["-1"]?["imageinfo"]?[0]?["url"];
        }
      }
    }

    return null;
  }
}
