// ================= Places Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/pages/places/places_list.dart';
import 'package:wiki_places/widgets/search_place/filters/tags_list.dart';

class PlacesPage extends StatefulWidget {
  PlacesPage({Key? key}) : super(key: key);

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  final StoreController _storeController = Get.put(StoreController());
  bool _freezePlacesList = true;

  void _loadMore() async {
    _storeController.updateGlobalIsLoading(true);
    double currentRadius = double.parse(_storeController.radius.value);

    if (currentRadius >= GlobalConstants.maxRadius) {
      displaySnackbar(title: 'strError'.tr, content: 'strCantIncreaseRadius'.trParams({
        'maxRadius': GlobalConstants.maxRadius.toString(),
      }));

    } else {
      setState(() {
        _freezePlacesList = false;
      });

      _storeController.updateRadius(min<double>(GlobalConstants.maxRadius, currentRadius + GlobalConstants.defaultLoadMoreStep).toString());
      if (!await _storeController.updatePlacesCollection()) {
        _storeController.updateRadius(currentRadius.toString());
      }
    }
    _storeController.updateGlobalIsLoading(false);

    Future.delayed(const Duration(milliseconds: 500), () {
      _freezePlacesList = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
        builder: (store) => PlacesList(
          key: _freezePlacesList ? Key(_storeController.filteredPlacesCollection.value.length.toString()) : null,
          placesCollection: _storeController.filteredPlacesCollection.value,
          placeholderContent: 'strNoPlacesAvailable'.tr,
          topWidgets: [TagsList(isWrap: false)],
          bottomWidgets: [
            Padding(
              padding: EdgeInsets.only(left: Get.width * 0.33, right: Get.width * 0.33),
              child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Get.theme.primaryColorLight) ), onPressed: _loadMore, child: Text('strLoadMore'.tr, style: Get.textTheme.bodyText2,)),
            ),
          ],
        ),
    );
  }
}
