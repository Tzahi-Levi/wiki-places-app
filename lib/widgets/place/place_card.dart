// ================= Place View =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/widgets/place/place_model.dart';
import 'package:wiki_places/global/utils.dart';

class Place extends StatelessWidget {
  const Place(this.model, {this.padding = 5, Key? key}) : super(key: key);
  final PlaceModel model;
  final double padding;

  IconData get _getFavoriteIcon => GlobalConstants.favoriteIcon;

  void _toggleFavorite() {  // TODO- add log to GA

  }

  void _openWikipedia() {
    openWikipedia(model.url);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: GestureDetector(
        onTap: _openWikipedia,
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          child: SizedBox(
            width: Get.width * 0.9,
            height: model.imageUrl == "" && model.abstract == "" ? 120 : 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                    child: Row(
                        children: [
                          Text(model.label, style: Get.textTheme.headline2, overflow: TextOverflow.ellipsis, maxLines: 1),
                          IconButton(onPressed: _toggleFavorite, icon: Icon(_getFavoriteIcon)),
                        ],
                    ),
                  ),
                ),
                SizedBox(
                  height: model.imageUrl == "" && model.abstract == "" ? 50 : 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: Get.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text(
                                  model.abstract,
                                  style: Get.textTheme.bodyText1,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: model.imageUrl != "",
                        child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                ),
                            ),
                            child: Image.network(model.imageUrl, width: 100, height: 100),
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
                        color: Colors.white70
                      ),
                      child: Visibility(
                        visible: model.distance != -1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(model.distance.toPrecisionString(), style: GoogleFonts.openSans(fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: const Color(0xff37536D))),
                              Text(" " + 'strKm'.tr, style: GoogleFonts.openSans(fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: const Color(0xff37536D))),
                            ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('strReadMore'.tr, style: Get.textTheme.bodyText2),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
