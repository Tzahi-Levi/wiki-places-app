// ================= Search Place Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:wiki_places/widgets/app_background.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/widgets/appbar.dart';
import 'package:wiki_places/widgets/search_place/change_radius_slider.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/widgets/search_place/search_place_widget/search_place_widget.dart';

class SearchPlacePage extends StatefulWidget {
  const SearchPlacePage({Key? key, this.afterSearchCallback}) : super(key: key);
  final Function? afterSearchCallback;

  @override
  State<SearchPlacePage> createState() => _SearchPlacePageState();
}

class _SearchPlacePageState extends State<SearchPlacePage> {
  final _storeController = Get.put(StoreController());
  late final TextEditingController _placeNameController = TextEditingController(text: _storeController.placeName.value);
  late final PrimitiveWrapper _placeModeController = PrimitiveWrapper(_storeController.placeMode.value);
  late final PrimitiveWrapper _radiusController = PrimitiveWrapper(double.parse(_storeController.radius.value));
  bool _resetFilters = true;
  bool _isLoading = false;
  Json _previousStore = {};

  @override
  void dispose() {
    _placeNameController.dispose();
    super.dispose();
  }

  void updateIsLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  void _savePreviousStore() {
    _previousStore = {
      'radius': _storeController.radius.value,
      'placeCoordinates': _storeController.placeCoordinates.value,
      'placeName': _storeController.placeName.value,
      'placeMode': _storeController.placeMode.value,
      'filters': _storeController.placeFilters.value.toList()
    };
  }

  void _restorePreviousStore() {
    _storeController.setStore(_previousStore);
  }

  void _toggleResetCategory(bool? value) {
    setState(() {
    _resetFilters = !_resetFilters;
    });
  }

  bool _isValidSearch() {
    if (_radiusController.value == 0) {
      displaySnackbar(
          title: 'strError'.tr,
          content: 'strRadiusMustBePositive'.tr
      );
      return false;
    }

    if (_placeNameController.text == "") {
      displaySnackbar(
          title: 'strError'.tr,
          content: 'strEmptyPlaceName'.tr
      );
      return false;
    }

    return true;
  }

  Future<bool> isOtherPlaceExist() async {
    if (await _storeController.updatePlaceToOtherMode(otherPlace: _placeNameController.text)) {
      return true;
    }

    displaySnackbar(
        title: 'strError'.tr,
        content: 'strPlaceNotExist'.tr
    );

    return false;
  }

  void _searchPlace() async {
    if (!_isValidSearch()) {
      return;
    }

    updateIsLoading(true);
    _savePreviousStore();

    if (_placeModeController.value == EPlaceMode.current) {
      await _storeController.updatePlaceToCurrentMode();

    } else if (!await isOtherPlaceExist()) {
        updateIsLoading(false);
        return;
    }

    if (_resetFilters) {
      _storeController.cleanAllFilters(reportToGA: false);
    }

    _storeController.updateRadius(_radiusController.value.toString());
    if (await _storeController.updatePlacesCollection()) {  // Search Succeeded
      navigateBack();
      if (widget.afterSearchCallback != null) {
        widget.afterSearchCallback!();
      }

    } else {
      _restorePreviousStore();
    }

    updateIsLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: MinorAppBar(title: 'strSearchPlaceAround'.tr),
      body: LoadingOverlay(
        isLoading: _isLoading,
        child: Stack(
          children: [
            const AppBackground(),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    color: Get.theme.primaryColorLight.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SearchPlaceWidget(placeNameController: _placeNameController, placeModeController: _placeModeController),
                          const Divider(),
                          ChangeRadiusSlider(controller: _radiusController),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('strResetFilters'.tr),
                              Checkbox(value: _resetFilters, onChanged: _toggleResetCategory),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SizedBox(
                      width: Get.width * 0.5,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _searchPlace,
                        child: Text('strSearch'.tr, style: Get.textTheme.headline2),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) => Get.theme.focusColor),
                          elevation: MaterialStateProperty.resolveWith((states) => 10),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
          ),
            )],
        ),
      ),
    );
  }
}
