// ================= Place View =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/widgets/place/place_model.dart';
import 'package:wiki_places/global/utils.dart';

class Place extends StatelessWidget {
  Place(this.model, {this.padding = 5, Key? key}) : super(key: key);
  final PlaceModel model;
  double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: Card(
        color: Colors.blueGrey,
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
                    model.imageUrl == null ? Container(width: 80, height: 50, color: Colors.black38,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 5, 20, 5),
                        child: CircularProgressIndicator(backgroundColor: Colors.black38,),
                      ),) : Container(
                        width: 80,
                        height: 50,
                        decoration: const BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.black38, offset: Offset(5,5), blurRadius: 10)]
                        ),
                        child: Image.network(model.imageUrl!, width: 80, height: 50,)),
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
