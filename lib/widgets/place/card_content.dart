import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/widgets/place/place_model.dart';

class CardContent extends StatelessWidget {
  const CardContent({required this.isExpanded, required this.model, required this.padding, required this.isCurrentLocation, required this.isFavorite, required this.toggleFavorite  ,Key? key}) : super(key: key);

  final bool isExpanded;
  final PlaceModel model;
  final double padding;
  final bool isCurrentLocation;
  final bool isFavorite;
  final Function toggleFavorite;


  void _openWikipedia() {
    openWikipedia(model.url);
  }

  @override
  Widget build(BuildContext context) {
    return isExpanded ? Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: model.imageUrl.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Image.network(model.imageUrl, cacheWidth: 200, cacheHeight: 200,),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Text(
            model.abstract,
            style: Get.textTheme.bodyText1,
            overflow: TextOverflow.ellipsis,
            maxLines: 100,
          ),
        ),
        Visibility(
          visible: model.distance != -1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 30,
                  maxHeight: 30,
                  minWidth: 80,
                  maxWidth: 280,
                ),

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                        color: Colors.white70
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(model.distance.toPrecisionString(), style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: const Color(0xff37536D))),
                          Text(" " + 'strKm'.tr, style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: const Color(0xff37536D))),
                          Visibility(
                            visible: isCurrentLocation,
                            child: Text(" " + 'strCurrentLocation'.tr, style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: const Color(0xff37536D))),
                          ),
                        ],
                      ),
                    ),
                  )],
                ),
              ),
              TextButton(onPressed: _openWikipedia, child: Text('strReadMore'.tr, style: Get.textTheme.headline5)),
            ],
          ),
        ),
      ],
    ) : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  model.abstract,
                  style: Get.textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ),
            Visibility(
              visible: model.imageUrl.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Image.network(model.imageUrl, cacheHeight: 100, cacheWidth: 100),
                ),
              ),
            ),
          ],
        ),
        Visibility(
          visible: model.distance != -1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 30,
                  maxHeight: 30,
                  minWidth: 80,
                  maxWidth: 280,
                ),

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                        color: Colors.white70
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(model.distance.toPrecisionString(), style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: const Color(0xff37536D))),
                          Text(" " + 'strKm'.tr, style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: const Color(0xff37536D))),
                          Visibility(
                            visible: isCurrentLocation,
                            child: Text(" " + 'strCurrentLocation'.tr, style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: const Color(0xff37536D))),
                          ),
                        ],
                      ),
                    ),
                  )],
                ),
              ),
              TextButton(onPressed: _openWikipedia, child: Text('strReadMore'.tr, style: Get.textTheme.headline5)),
            ],
          ),
        ),
      ],
    );
  }
}
