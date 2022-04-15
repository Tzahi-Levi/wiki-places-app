// ================= Home Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/store_controller.dart';
import 'package:wiki_places/widgets/appbar.dart';
import 'package:wiki_places/widgets/bottom_navigation.dart';
import 'package:wiki_places/pages/places/places.dart';
import 'package:wiki_places/pages/map/map.dart';
import 'package:wiki_places/global/types.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _storeController = Get.put(StoreController());

  Widget _openCurrentPage() {
    switch (_storeController.currentMainAppPage.value) {
      case AppPages.map:
        return const MapPage();

      case AppPages.places:
      default:
        return const PlacesPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
        builder: (store) => Scaffold(
          body: _openCurrentPage(),
          bottomNavigationBar: BottomNavigation(),
        )
    );
  }
}
