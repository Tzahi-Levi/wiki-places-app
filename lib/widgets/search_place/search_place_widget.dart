// ================= Search Place Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/widgets/radio_buttons.dart';

class SearchPlaceWidget extends StatefulWidget {
  SearchPlaceWidget({required this.placeNameController, required this.placeModeController, Key? key}) : super(key: key);
  final TextEditingController placeNameController;
  final PrimitiveWrapper placeModeController;

  @override
  State<SearchPlaceWidget> createState() => _SearchPlaceWidgetState();
}

class _SearchPlaceWidgetState extends State<SearchPlaceWidget> {
  final _storeController = Get.put(StoreController());

  @override
  void initState() {
    super.initState();
    _updatePlaceName(widget.placeModeController.value);
  }

  void _updatePlaceName(EPlaceMode newPlace) {
    setState(() {
      widget.placeNameController.text = (newPlace == EPlaceMode.current) ? 'strCurrentPlace'.tr : _storeController.placeName.value;
    });
  }

  void _resetText() {
    widget.placeNameController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('strPlace'.tr),
            RadioButtons(
              options: [{'value': EPlaceMode.current, 'name': 'strCurrentPlace'.tr}, {'value': EPlaceMode.other, 'name': 'strOtherPlace'.tr}],
              controller: widget.placeModeController,
              onChangeCallback: _updatePlaceName,
            )
          ],
        ),
        TextField(
          controller: widget.placeNameController,
          onTap: _resetText,
          enabled: widget.placeModeController.value == EPlaceMode.other,
          decoration: InputDecoration(
            hintText: 'strChooseOtherPlace'.tr,
          ),
        ),
      ],
    );
  }
}
