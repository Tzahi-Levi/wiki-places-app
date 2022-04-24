// ================= Change Radius Appbar =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/widgets/appbar.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/widgets/about_the_app.dart';

class ChangeRadiusAppbar extends StatelessWidget implements PreferredSizeWidget {
  ChangeRadiusAppbar({this.appTitle = false, Key? key}) : super(key: key);
  final _storeController = Get.put(StoreController());
  final bool appTitle;
  late double _currentSliderValue = double.parse(_storeController.radius.value);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _changeRadius() {
    navigateBack();
    if (_currentSliderValue == 0) {
      displaySnackbar(title: 'strError'.tr, content:'strRadiusMustBePositive'.tr);
    } else {
      _storeController.updateIsLoading(true);
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
            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Text('${_currentSliderValue.toPrecisionString()} ${GlobalConstants.defaultScale}'),
                  Slider(
                      value: _currentSliderValue,
                      min: GlobalConstants.minRadius,
                      max: GlobalConstants.maxRadius,
                      divisions: GlobalConstants.radiusSliderDivisions,
                      label: '${_currentSliderValue.toPrecisionString()} ${GlobalConstants.defaultScale}',
                      onChanged: (value) {
                        _updateSlider(value, setStateFunction);
                      }
                  ),
                  ElevatedButton(
                    onPressed: _changeRadius,
                    child: Text('strChangeRadius'.tr),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WikiPlacesAppBar(
      appTitle: appTitle,
      actions: [
        const AboutTheApp(),
        IconButton(
          onPressed: _openChangeRadiusDialog,
          icon: const Icon(GlobalConstants.updateRadiusIcon, size: 25, color: Colors.white),
        ),
      ],
    );
  }
}
