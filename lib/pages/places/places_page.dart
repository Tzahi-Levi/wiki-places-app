// ================= Places Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/widgets/place/place.dart';
import 'package:wiki_places/pages/placeholder_page/placeholder_page.dart';
import 'package:wiki_places/widgets/appbar.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/widgets/search_places_fab.dart';

class PlacesPage extends StatelessWidget {
  PlacesPage({Key? key}) : super(key: key);
  final _storeController = Get.put(StoreController());
  late double _currentSliderValue = double.parse(_storeController.radius.value);

  void _changeRadius() {
    navigateBack();
    if (_currentSliderValue == 0) {
      displaySnackbar(title: 'strError'.tr, content:'strRadiusMustBePositive'.tr);
    } else {
      _storeController.changeRadius(_currentSliderValue.toString());
    }
  }

  void _updateSlider(double value, Function setStateFunction) {
    setStateFunction(() {
      _currentSliderValue = value;
    });
  }

  void _openChangeRadiusDialog() {
    openModalBottomSheet(
      children: [
        StatefulBuilder(
          builder: (context, setStateFunction) {
            return Column(
              children: [
                Row(
                  children: [
                    Slider(
                        value: _currentSliderValue,
                        min: GlobalConstants.minRadius,
                        max: GlobalConstants.maxRadius,
                        divisions: GlobalConstants.radiusSliderDivisions,
                        label: _currentSliderValue.toPrecisionString() + " " + GlobalConstants.defaultScale,
                        onChanged: (value) {
                          _updateSlider(value, setStateFunction);
                        }
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: _changeRadius,
                  child: Text('strChangeRadius'.tr),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  List<Place> _getPlaces() {
    List<Place> placesList = [];
    for (var placeData in _storeController.placesCollection.value.places) {
      placesList.add(Place(placeData));
    }
    return placesList;
  }

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
      builder: (store) => _storeController.placesCollection.value.isEmpty ?
      PlaceholderPage(
        content: 'strSetRadius'.tr,
        icon: GlobalConstants.searchIcon,
      ) : Scaffold(
            appBar: WikiPlacesAppBar(
              actions: [
                IconButton(
                    onPressed: _openChangeRadiusDialog,
                    icon: const Icon(GlobalConstants.updateRadiusIcon),
                ),
              ],
            ),
            body: ListView(
              children: _getPlaces(),
            ),
            floatingActionButton: SearchPlacesFAB(),
          ),
    );
  }
}
