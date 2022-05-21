// ================= Places Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/pages/places/places_list.dart';
import 'package:wiki_places/widgets/about_the_app.dart';

class PlacesPage extends StatelessWidget {
  PlacesPage({Key? key}) : super(key: key);
  final StoreController _storeController = Get.put(StoreController());

  void _loadMore() async {
    _storeController.updateGlobalIsLoading(true);
    double currentRadius = double.parse(_storeController.radius.value);

    if (currentRadius >= GlobalConstants.maxRadius) {
      displaySnackbar(title: 'strError'.tr, content: 'strCantIncreaseRadius'.trParams({
        'maxRadius': GlobalConstants.maxRadius.toString(),
      }));

    } else {
      _storeController.updateRadius(min<double>(GlobalConstants.maxRadius, currentRadius + GlobalConstants.defaultLoadMoreStep).toString());
      await _storeController.updatePlacesCollection();
    }
    _storeController.updateGlobalIsLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
        builder: (store) => PlacesList(
          placesCollection: _storeController.placesCollection.value,
          placeholderContent: 'strNoPlacesAvailable'.tr,
          bottomWidgets: [
            Padding(
              padding: EdgeInsets.only(left: Get.width * 0.33, right: Get.width * 0.33),
              child: ElevatedButton(onPressed: _loadMore, child: Text('strLoadMore'.tr)),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 65.0),
              child: AboutTheApp(),
            ),
          ],
        ),
    );
  }
}
