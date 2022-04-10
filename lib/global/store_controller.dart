// ================= Store Controller =================
import 'package:get/get.dart';

class StoreController extends GetxController {
  final RxInt counter = 0.obs;

  void increase() {
    counter.value++;
    update();
  }
}
