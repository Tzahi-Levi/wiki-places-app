// ================= Search Place Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPlaceWidget extends StatelessWidget {
  SearchPlaceWidget({this.controller, Key? key}) : super(key: key);
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('strCurrentPlace'.tr),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'strPlaceName'.tr,
          ),
        ),
      ],
    );
  }
}
