// ================= Place View =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
              Expanded(child: Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                child: Text(model.label, style: Get.textTheme.headline2, overflow: TextOverflow.ellipsis, maxLines: 1,),
              )),
              SizedBox(
                height: 80,
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
                            Expanded(
                                child: Text(model.abstract,
                                  style: Get.textTheme.bodyText1,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,))
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
                      color: Colors.white70
                    ),
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
                  TextButton(
                    onPressed: () {openWikipedia(model.url);},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text('strReadMore'.tr, style: Get.textTheme.bodyText2),
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
