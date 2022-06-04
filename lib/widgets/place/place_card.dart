// ================= Place View =================
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/widgets/place/place_model.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/controllers/favorites_controller.dart';

import 'package:wiki_places/widgets/place/card_content.dart';

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
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        child: ExpandablePanel(
          header:         Row(
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
          collapsed: CardContent(isExpanded: false, model: widget.model, isCurrentLocation: widget.isCurrentLocation, toggleFavorite: _toggleFavorite, padding: widget.padding,  isFavorite: _isFavorite ),
          expanded: CardContent(isExpanded: true, model: widget.model, isCurrentLocation: widget.isCurrentLocation, toggleFavorite: _toggleFavorite, padding: widget.padding, isFavorite: _isFavorite ),
        ),
      ),
    );
  }
}
