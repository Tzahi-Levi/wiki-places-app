// ================= Change Radius Slider =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/types.dart';

class ChangeRadiusSlider extends StatefulWidget {
  ChangeRadiusSlider({this.radius, Key? key}) : super(key: key);
  PrimitiveWrapper? radius;

  @override
  State<ChangeRadiusSlider> createState() => _ChangeRadiusSliderState();
}

class _ChangeRadiusSliderState extends State<ChangeRadiusSlider> {
  final _storeController = Get.put(StoreController());

  @override
  void initState() {
    super.initState();
    widget.radius ??= PrimitiveWrapper(double.parse(_storeController.radius.value));
  }

  void _updateSlider(double value) {
    setState(() {
      widget.radius!.value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Text('strChangeRadius'.tr),
          Slider(
              value: widget.radius!.value,
              min: GlobalConstants.minRadius,
              max: GlobalConstants.maxRadius,
              divisions: GlobalConstants.radiusSliderDivisions,
              label: '${widget.radius!.value} ${GlobalConstants.defaultScale}',
              onChanged: (value) {
                _updateSlider(value);
              }
          ),
          Text('${widget.radius!.value} ${GlobalConstants.defaultScale}'),
        ],
      ),
    );
  }
}
