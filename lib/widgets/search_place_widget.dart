// ================= Search Place Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  void _switchPlace(String newPlace) {
    setState(() {
      if (newPlace == 'strCurrentPlace'.tr) {

      } else {

      }
    });
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
          enabled: widget.placeController != null && widget.placeController!.value == 'strOtherPlace'.tr,
          decoration: InputDecoration(
            hintText: 'strPlaceName'.tr,
          ),
        ),
      ],
    );
  }
}
