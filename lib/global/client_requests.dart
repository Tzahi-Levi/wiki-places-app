// ================= Client Requests =================
import 'package:get/get.dart';
import 'config.dart';

class ClientRequests extends GetConnect {
  static final ClientRequests _instance = ClientRequests._();
  static ClientRequests get instance => _instance;
  ClientRequests._();

  Future<Response> getPlacesData(String radius, String lat, String lon) => get('http://${ProjectConfig.serverAddress}/wiki_by_place?radius=$radius&lat,lon=$lat,$lon');
}
