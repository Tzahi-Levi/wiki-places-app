// ================= Place View =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/widgets/place/place_model.dart';
import 'package:wiki_places/global/utils.dart';

class Place extends StatelessWidget {
  Place(this.model, this.last, {Key? key}) : super(key: key);
  final PlaceModel model;
  bool last = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: last ? const EdgeInsets.only(bottom: 80.0) : const EdgeInsets.only(bottom: 5.0),
      child: Card(
        color: Colors.blueGrey,  // TODO- change in design
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        child: SizedBox(
          width: Get.width * 0.9,
          height: 170,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(width: 50, height: 50, color: Colors.black38,), // TODO - replace with image
                    SizedBox(
                      width: Get.width * 0.7,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(model.label),
                            Expanded(
                                child: Text(model.abstract,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80,
                    height: 30,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                      color: Colors.blue, //TODO - remove after theme defines
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(model.distance.toPrecisionString()),
                          Text(" " + 'strKm'.tr),
                        ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {openWikipedia(model.url);},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text('strReadMore'.tr),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
