// ================= Client Requests =================
import 'package:get/get.dart';
import 'package:wiki_places/global/config.dart';
import 'package:wiki_places/localization/resources/resources_en.dart';

class ClientRequests extends GetConnect {
  static final ClientRequests _instance = ClientRequests._();

  static ClientRequests get instance => _instance;

  ClientRequests._();

  Future<Response> getPlacesData({String radius = '', double lat = 0, double lon = 0}) =>
      get('http://${ProjectConfig.serverAddress}''/wiki_by_place?radius=$radius${resourcesEn['strKm']!.toLowerCase()}&lat,lon=${lat.toString()},${lon.toString()}');
}
