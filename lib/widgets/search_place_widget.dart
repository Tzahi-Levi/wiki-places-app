// ================= Search Place Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/widgets/radio_buttons.dart';

class SearchPlaceWidget extends StatefulWidget {
  SearchPlaceWidget({this.textController, this.placeController, Key? key}) : super(key: key);
  TextEditingController? textController;
  PrimitiveWrapper? placeController;

  @override
  State<SearchPlaceWidget> createState() => _SearchPlaceWidgetState();
}

class _SearchPlaceWidgetState extends State<SearchPlaceWidget> {
  final _storeController = Get.put(StoreController());

  String get _getOtherPlaceText => (_storeController.placeName.value == 'strCurrentPlace'.tr) ? "" : _storeController.placeName.value;

  void _switchPlace(String newPlace) {
    if (widget.textController == null) {
      return;
    }

    setState(() {
      widget.textController!.text = (newPlace == 'strCurrentPlace'.tr) ? 'strCurrentPlace'.tr : _getOtherPlaceText;
    });
  }

  void _resetText() {
    if (widget.textController != null) {
      widget.textController!.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('strPlace'.tr),
            RadioButtons(
              options: ['strCurrentPlace'.tr, 'strOtherPlace'.tr],
              controller: widget.placeController,
              onChangeCallback: _switchPlace,
            )
          ],
        ),
        TextField(
          controller: widget.textController,
          onTap: _resetText,
          enabled: widget.placeController != null && widget.placeController!.value == 'strOtherPlace'.tr,
          decoration: InputDecoration(
            hintText: 'strPlaceName'.tr,
          ),
        ),
      ],
    );
  }
}
