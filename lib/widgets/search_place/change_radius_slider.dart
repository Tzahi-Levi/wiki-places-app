// ================= Change Radius Slider =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/types.dart';

class ChangeRadiusSlider extends StatefulWidget {
  ChangeRadiusSlider({required this.controller, Key? key}) : super(key: key);
  PrimitiveWrapper controller;

  @override
  State<ChangeRadiusSlider> createState() => _ChangeRadiusSliderState();
}

class _ChangeRadiusSliderState extends State<ChangeRadiusSlider> {
  final _storeController = Get.put(StoreController());

  @override
  void initState() {
    super.initState();
    widget.controller = PrimitiveWrapper(double.parse(_storeController.radius.value));
  }

  void _updateSlider(double value) {
    setState(() {
      widget.controller.value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('strChangeRadius'.tr),
          Slider(
              value: widget.controller.value,
              min: GlobalConstants.minRadius,
              max: GlobalConstants.maxRadius,
              divisions: GlobalConstants.radiusSliderDivisions,
              label: '${widget.controller.value} ${GlobalConstants.defaultScale}',
              onChanged: _updateSlider,
          ),
          Text('${widget.controller.value} ${GlobalConstants.defaultScale}'),
        ],
      ),
    );
  }
}
