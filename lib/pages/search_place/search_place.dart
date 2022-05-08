// ================= Search Place Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/widgets/appbar.dart';
import 'package:wiki_places/widgets/change_radius_slider.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/global/utils.dart';

class SearchPlacePage extends StatelessWidget {
  SearchPlacePage({Key? key}) : super(key: key);
  final _storeController = Get.put(StoreController());
  late final TextEditingController _placeController = TextEditingController();  // TODO- add the name
  late final PrimitiveWrapper _radius = PrimitiveWrapper(double.parse(_storeController.radius.value));

  void _searchPlace() {
    searchPlace(radius: _radius.value, placeName: _placeController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WikiPlacesAppBar(title: 'strSearchPlaceAround'.tr),
      body: Column(
        children: [
          TextField(controller: _placeController),
          const Divider(),
          ChangeRadiusSlider(radius: _radius),
          ElevatedButton(onPressed: _searchPlace, child: Text('strSearch'.tr)),
        ],
      ),
    );
  }
}
