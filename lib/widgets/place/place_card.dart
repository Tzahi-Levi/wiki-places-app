// ================= Place View =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/widgets/place/place_model.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/controllers/favorites_controller.dart';

class Place extends StatefulWidget {
  const Place(this.model, {this.padding = 5, this.isCurrentLocation = false, Key? key}) : super(key: key);
  final PlaceModel model;
  final double padding;
  final bool isCurrentLocation;

  @override
  State<Place> createState() => _PlaceState();
}

class _PlaceState extends State<Place> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = FavoritesController.instance.checkIfFavorite(widget.model);
  }

  void _toggleFavorite() {
    _isFavorite ? FavoritesController.instance.removePlaceFromFavorites(widget.model) : FavoritesController.instance.addPlaceToFavorites(widget.model);
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  void _openWikipedia() {
    openWikipedia(widget.model.url);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.padding),
      child: GestureDetector(
        onTap: _openWikipedia,
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      flex: 15,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(widget.model.label, style: Get.textTheme.headline2, overflow: TextOverflow.ellipsis, maxLines: 2),
                      )),
                  IconButton(onPressed: _toggleFavorite, icon: Icon(_isFavorite ? GlobalConstants.favoriteIcon : GlobalConstants.nonFavoriteIcon, color: Colors.red.shade600)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text(
                        widget.model.abstract,
                        style: Get.textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.model.imageUrl.isNotEmpty,
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
                        child: Image.network(widget.model.imageUrl, width: 100, height: 100),
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: widget.model.distance != -1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: widget.isCurrentLocation ? 200 : 80,
                      height: 30,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                          color: Colors.white70
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.model.distance.toPrecisionString(), style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: const Color(0xff37536D))),
                          Text(" " + 'strKm'.tr, style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: const Color(0xff37536D))),
                          Visibility(
                            visible: widget.isCurrentLocation,
                            child: Text(" " + 'strCurrentLocation'.tr, style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: const Color(0xff37536D))),
                          ),
                        ],
                      ),
                    ),
                    TextButton(onPressed: _openWikipedia, child: Text('strReadMore'.tr, style: Get.textTheme.bodyText2)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
