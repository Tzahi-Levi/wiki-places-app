// ================= Home Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/store_controller.dart';
import 'package:wiki_places/widgets/appbar.dart';
import 'package:wiki_places/widgets/bottom_navigation.dart';
import 'package:wiki_places/global/types.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _storeController = Get.put(StoreController());

  Widget _openCurrentPage() {
    switch (_storeController.currentMainAppPage.value) {
      case AppPages.map:
        return const Scaffold(body: Text("map"));

      case AppPages.places:
      default:
        return const Scaffold(body: Text("places"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
        builder: (store) => Scaffold(
          appBar: const WikiPlacesAppBar(),
          body: _openCurrentPage(),
          bottomNavigationBar: BottomNavigation(),
        )
    );
  }
}
