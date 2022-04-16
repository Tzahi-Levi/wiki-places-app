// ================= Place View =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/widgets/place/place_model.dart';
import 'package:wiki_places/global/utils.dart';

class Place extends StatelessWidget {
  const Place(this.model, {Key? key}) : super(key: key);
  final PlaceModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,  // TODO- change in design
      child: Column(
        children: [
          Text(model.label),
          Row(
            children: [
              // Image.network(model.url),  // TODO- figure out how to present the image
              Text(model.abstract),
            ],
          ),
          TextButton(
              onPressed: () {openWikipedia(model.url);},
              child: Text('strReadMore'.tr),
          ),
          Container(
            color: Colors.white,  // TODO- change in design
            child: Row(
                children: [
                  Text(model.distance.toPrecisionString()),
                  Text(" " + 'strKm'.tr),
                ],
            ),
          ),
        ],
      ),
    );
  }
}
