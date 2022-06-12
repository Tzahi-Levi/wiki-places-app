// ================= Card Content =================
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wiki_places/controllers/favorites_controller.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/widgets/place/place_model.dart';

class CardContent extends StatefulWidget {
  const CardContent({required this.model, required this.padding, required this.isCurrentLocation, Key? key}) : super(key: key);
  final PlaceModel model;
  final double padding;
  final bool isCurrentLocation;

  @override
  State<CardContent> createState() => _CardContentState();
}

class _CardContentState extends State<CardContent> {
  late bool _isFavorite;

  void _openWikipedia() {
    openWikipedia(widget.model.url);
  }

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

  @override
  Widget build(BuildContext context) {
    return ScrollOnExpand(
      child: ExpandablePanel(
        theme: const ExpandableThemeData(
          tapBodyToExpand: true,
          tapBodyToCollapse: true,
        ),
        header: Row(
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
        collapsed:  Column(
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
                      widget.model.abstract,
                      style: Get.textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Visibility(
                    visible: widget.model.imageUrl.isNotEmpty,
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10),
                        ),
                        child: Image.network(widget.model.imageUrl, cacheWidth: 100, cacheHeight: 100,),
                      ),
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
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                            color: Get.theme.primaryColor
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(widget.model.distance.toPrecisionString(), style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white)),
                              Text(" " + 'strKm'.tr, style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white)),
                              Visibility(
                                visible: widget.isCurrentLocation,
                                child: Text(" " + 'strCurrentLocation'.tr, style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color:Colors.white)),
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
        ),
        expanded: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: widget.model.imageUrl.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20),
                  ),
                  child: Image.network(widget.model.imageUrl, cacheWidth: 200, cacheHeight: 200,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                widget.model.abstract,
                style: Get.textTheme.bodyText1,
                overflow: TextOverflow.ellipsis,
                maxLines: 100,
              ),
            ),
            Visibility(
              visible: widget.model.distance != -1,
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
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                            color: Theme.of(context).primaryColor
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(widget.model.distance.toPrecisionString(), style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white)),
                              Text(" " + 'strKm'.tr, style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white)),
                              Visibility(
                                visible: widget.isCurrentLocation,
                                child: Text(" " + 'strCurrentLocation'.tr, style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.normal, color:Colors.white)),
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
        ),
        builder: (_,collapsed, expanded) => Expandable(
          collapsed: collapsed,
          expanded: expanded,
        ),
      ),
    );
  }
}
