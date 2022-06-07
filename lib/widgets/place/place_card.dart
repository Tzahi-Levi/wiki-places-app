// ================= Place View =================
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:wiki_places/widgets/place/place_model.dart';
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

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Padding(
        padding: EdgeInsets.only(bottom: widget.padding),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          child: CardContent(model: widget.model, isCurrentLocation: widget.isCurrentLocation, padding: widget.padding)
        ),
      ),
    );
  }
}
