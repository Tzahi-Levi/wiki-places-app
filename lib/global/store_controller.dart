// ================= Store Controller =================
import 'package:get/get.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/global/utils.dart';

class StoreController extends GetxController {
  // State
  final Rx<AppPages> currentMainAppPage = AppPages.places.obs;

  // Actions
  void changeMainAppPage(int newPageIndex) {
    currentMainAppPage.value = indexToEnum(AppPages.values, newPageIndex);
    update();
  }
}
