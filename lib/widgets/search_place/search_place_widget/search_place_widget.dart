// ================= Search Place Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/widgets/radio_buttons.dart';
import 'package:wiki_places/widgets/search_place/search_place_widget/search_textfield.dart';

class SearchPlaceWidget extends StatefulWidget {
  const SearchPlaceWidget({required this.placeNameController, required this.placeModeController, Key? key}) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('strPlace'.tr),
        RadioButtons(
          options: [
            {'value': EPlaceMode.current, 'name': 'strCurrentPlace'.tr},
            {'value': EPlaceMode.other, 'name': 'strOtherPlace'.tr}
          ],
          controller: widget.placeModeController,
          onChangeCallback: _updatePlaceName,
        ),
        SizedBox(
          height: 60,
          child: SearchTextField(
              placeNameController: widget.placeNameController,
              isEnabled: widget.placeModeController.value == EPlaceMode.other,
          ),
        ),
      ],
    );
  }
}
