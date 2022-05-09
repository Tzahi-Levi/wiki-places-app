// ================= Search Place Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/widgets/appbar.dart';
import 'package:wiki_places/widgets/change_radius_slider.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/widgets/filters.dart';
import 'package:wiki_places/widgets/search_place_widget.dart';

class SearchPlacePage extends StatefulWidget {
  const SearchPlacePage({Key? key}) : super(key: key);

  @override
  State<SearchPlacePage> createState() => _SearchPlacePageState();
}

class _SearchPlacePageState extends State<SearchPlacePage> {
  final _storeController = Get.put(StoreController());
  late final TextEditingController _textController = TextEditingController(text: _storeController.placeName.value);
  late final PrimitiveWrapper _placeController = PrimitiveWrapper(_storeController.placeName.value == 'strCurrentPlace'.tr ? 'strCurrentPlace'.tr : 'strOtherPlace'.tr);
  late final PrimitiveWrapper _radius = PrimitiveWrapper(double.parse(_storeController.radius.value));

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _searchPlace() {
    searchPlace(radius: _radius.value, placeName: _placeController.value == 'strCurrentPlace'.tr ? '' : _textController.text);  // TODO
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WikiPlacesAppBar(title: 'strSearchPlaceAround'.tr),
      body: Column(
        children: [
          SearchPlaceWidget(textController: _textController, placeController: _placeController),
          const Divider(),
          const Filters(),
          const Divider(),
          ChangeRadiusSlider(controller: _radius),
          ElevatedButton(onPressed: _searchPlace, child: Text('strSearch'.tr)),
        ],
      ),
    );
  }
}
